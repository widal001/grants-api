from sqlalchemy import select
from sqlalchemy.orm import joinedload

import src.adapters.db as db
from src.api.route_utils import raise_flask_error
from src.db.models.opportunity_models import Opportunity
from src.db.models.transfer.topportunity_models import TransferTopportunity
from src.services.opportunities_v0.opportunity_service_shared import convert_transfer_opp_to_regular


def get_opportunity(db_session: db.Session, opportunity_id: int) -> Opportunity:
    # For now, only non-drafts can be fetched
    opportunity: TransferTopportunity | None = db_session.execute(
        select(TransferTopportunity)
        .where(TransferTopportunity.opportunity_id == opportunity_id)
        .where(TransferTopportunity.is_draft == "N")
    ).scalar_one_or_none()

    if opportunity is None:
        raise_flask_error(404, message=f"Could not find Opportunity with ID {opportunity_id}")

    return convert_transfer_opp_to_regular(opportunity)


def get_opportunity_v01(db_session: db.Session, opportunity_id: int) -> Opportunity:
    opportunity: Opportunity | None = (
        db_session.execute(
            select(Opportunity)
            .where(Opportunity.opportunity_id == opportunity_id)
            .where(Opportunity.is_draft.is_(False))
            .options(joinedload("*"))
        )
        .unique()
        .scalar_one_or_none()
    )

    if opportunity is None:
        raise_flask_error(404, message=f"Could not find Opportunity with ID {opportunity_id}")

    return opportunity
