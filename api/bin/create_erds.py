# Generate database schema diagrams from our SQLAlchemy models
import codecs
import logging
import os
import pathlib
from typing import Any

import pydot
import sadisplay

import src.db.models.staging.forecast as staging_forecast_models
import src.db.models.staging.opportunity as staging_opportunity_models
import src.db.models.staging.synopsis as staging_synopsis_models
import src.logging
from src.db.models import opportunity_models
from src.db.models.transfer import topportunity_models

logger = logging.getLogger(__name__)

# Construct the path to the folder this file is within
# This gets an absolute path so that where you run the script from won't matter
# and should always resolve to the app/erds folder
ERD_FOLDER = pathlib.Path(__file__).parent.resolve()

# If we want to generate separate files for more specific groups, we can set that up here
API_MODULES = (opportunity_models,)
STAGING_TABLE_MODULES = (
    staging_opportunity_models,
    staging_forecast_models,
    staging_synopsis_models,
)
TRANSFER_TABLE_MODULES = (topportunity_models,)

# Any modules you add above, merge together for the full schema to be generated
ALL_MODULES = API_MODULES + STAGING_TABLE_MODULES + TRANSFER_TABLE_MODULES


def create_erds(modules: Any, file_name: str) -> None:
    logger.info("Generating ERD diagrams for %s", file_name)

    items = []
    for module in modules:
        items.extend([getattr(module, attr) for attr in dir(module)])

    description = sadisplay.describe(
        items,
        show_methods=True,
        show_properties=True,
        show_indexes=True,
    )

    dot_file_name = ERD_FOLDER / f"{file_name}.dot"

    # We create a temporary .dot file which we then convert to a png
    with codecs.open(str(dot_file_name), "w", encoding="utf8") as f:
        f.write(sadisplay.dot(description))

    (graph,) = pydot.graph_from_dot_file(dot_file_name)

    png_file_path = ERD_FOLDER / f"{file_name}.png"
    logger.info("Creating ERD diagram at %s", png_file_path)
    graph.write_png(png_file_path)

    # remove the temporary .dot file
    os.remove(dot_file_name)


def main() -> None:
    with src.logging.init(__package__):
        logger.info("Generating ERD diagrams")

        create_erds(ALL_MODULES, "full-schema")
        create_erds(API_MODULES, "api-schema")
        create_erds(STAGING_TABLE_MODULES, "staging-schema")
        create_erds(TRANSFER_TABLE_MODULES, "transfer-schema")
