---
description: >-
  Host a public participatory process in which open source contributors are
  invited to submit designs and code for improvements to the simpler.grants.gov
  site.
---

# Collaborative code challenge

## Summary details

<table><thead><tr><th width="253">Field</th><th>Value</th></tr></thead><tbody><tr><td><strong>Deliverable status</strong></td><td>Planning</td></tr><tr><td><strong>Link to GitHub issue</strong></td><td><a href="https://github.com/HHS/simpler-grants-gov/issues/130">Issue 130</a></td></tr><tr><td><strong>Responsible parties</strong></td><td><ul><li><a data-mention href="https://app.gitbook.com/u/birUyinL3yXkEkQ7tr3GgNrCZCC3">Brandon Tabaska</a></li></ul></td></tr><tr><td><strong>Key sections</strong></td><td><ul><li><p><a href="collaborative-code-challenge.md#overview">Overview</a></p><ul><li><a href="collaborative-code-challenge.md#business-value">Business value</a></li><li><a href="collaborative-code-challenge.md#user-stories">User stories</a></li></ul></li><li><p><a href="collaborative-code-challenge.md#technical-description">Technical description</a></p><ul><li><a href="collaborative-code-challenge.md#definition-of-done">Definition of done</a></li><li><a href="collaborative-code-challenge.md#proposed-metrics">Proposed metrics</a></li></ul></li><li><a href="collaborative-code-challenge.md#assumptions-and-dependencies">Dependencies and assumptions</a></li></ul></td></tr></tbody></table>

## Overview

### Summary

* **What:** Host a public event in which open source contributors are invited to submit designs and/or code for a focused area of the site, such as an updated opportunity listing page or improved search experience.
* **Why:**&#x20;
  * Builds excitement within the open source community and allows us to incorporate ideas from our participatory processes and code from members of the public to improve the grants experience on simpler.grants.gov.&#x20;
  * This effort helps us plan for future open source engagements and ensures that we build products and establish a roadmap that include a participatory process.
* **Who**
  * Open source contributors who will be submitting code
  * Internal and community developers who will iterate on open source contributions
* **Out of scope**
  * Incorporating submissions into our codebase. If we decide to adopt code or designs contributed by the public, incorporating those submissions will happen outside this deliverable.
  * Months-long engagement. While it is an explicit goal to use this first challenge as a test run for future multi-phase challenges, this event is only scoped to run for a few days.

### Business value

#### Problem

While more participatory models for stakeholder engagement, such as co-design groups, can surface user needs and feature requests that might not emerge through traditional user research, the ability to implement this feedback is often limited by internal capacity. Open source projects provide a valuable way for members of the public to contribute features or fix bugs that might otherwise linger in a product backlog, but the current model for open source projects often fails to appropriately reward contributors for the value they provide to projects which limits the accessibility of open source contributions. One of the main goals of the Simpler.Grants.gov initiative is to foster a participatory development process while simultaneously ensuring that participants are compensated fairly for their time and effort.

#### Value

One potential strategy to achieve this goal is to incentivize contributions through a public code and design challenge, similar to an aspirational model pioneered by the [NASA Space Apps Challenge](https://www.spaceappschallenge.org/2023/awards/). By inviting members of the public to submit their own designs, features, and prototypes that build on public data, code challenge events provide a testing ground for meaningful improvements to the functionality of federal systems.&#x20;

Pairing the hackathon model with a financial incentive for a subset of submissions also has the ability to compensate participants for their time and effort in ways that traditional open source projects lack. In addition to incentivizing participation from open source contribution, a challenge also provides an opportunity to engage both applicant and federal stakeholders by inviting them to review and provide feedback on the resulting submissions. With the right approach and resources, a well-run code and design challenge could strengthen not only the value that the simpler.grants.gov platform provides to users, but also the community it fosters within the grants ecosystem.

#### Goals

* Build traction for the open source community to have meaningful engagement, and get the public and stakeholders excited about getting involved in the project
* Enable members of federal staff and the co-design group to provide feedback on contributions from the open source community
* Incentivize code contributions from the open source community
* Lay the foundation for future, multi-phase code and design challenges in the future that may span multiple months
* Build experience with tools and processes for participatory contributions such as upvoting ideas and receiving submissions
* Allow engagement from underserved communities and contributors to form a more relational bond&#x20;

### User stories

* As an **open source contributor**, I want:
  * to be rewarded for my contributions to the simpler.grants.gov project, so that I am fairly compensated for my time and the value that I provide to the project.
  * to have access to real data during the challenge (e.g. through an API), so that my submission can demonstrate value to applicants who are actively searching for grants.
  * to have access to simpler.grants.gov design assets and guidelines, so that my submission supports a consistent user interface and experience for applicants.
  * to be able to communicate with other participants and event organizers during the challenge, so that I can ask questions, get updates, and collaborate with my team more easily.
  * to get to learn more about the simpler.grants.gov project, goals, and the community, so that I can feel included, a part of a greater collaborative effort, and contribute to something meaningful,.
* As an **event coordinator**, I want:
  * participants to be able to formally register for the event(s), so that we can estimate attendance and communicate with participants prior to the event(s).
  * to gain useful data about the open source community members such as availability, location, and general feedback, so that we can make improvements to future coordination efforts.&#x20;
* As a **project maintainer**, I want:
  * submissions to adopt shared tools and frameworks where possible, so that it will be easier to incorporate valuable features into our codebase.
* As a **member of HHS staff**, I want:
  * to review and provide feedback on the submissions, so that I can see the kinds of features and improvements the open source community would like us to include in our roadmap.
  * to make sure that we create a meaningful experience for our open source contributors so that we can continue to build the open source community.
  * a playbook for organizing similar events in the future, so that can incorporate lessons learned and simplify the planning process for subsequent code and design challenges.

### Definition of done

Following sections describe the conditions that must be met to consider this deliverable "done".

#### **Must have**

* [ ] Decisions to the questions outlined in the the technical and implementation of the code challenge are documented in our wiki or through our ADR process
* [ ] A single or multi-day code challenge event is hosted with:
  * [ ] At least 3 registered participants from the public
  * [ ] At least 1 submission from the public
* [ ] Prior to the event:
  * [ ] Tools needed to facilitate the event are chosen, procured, and implemented using the tools that we have available
  * [ ] Participants can register and receive updates from event coordinators
  * [ ] A budget and a payment mechanism to reward challenge submissions are approved by the necessary stakeholders
* [ ] During the event, participants have access to:
  * [ ] The data they need to build or prototype new functionality for simpler.grants.gov
  * [ ] Design assets and guidelines (logos, colors, etc.) for simpler.grants.gov
  * [ ] A clear rubric or set of criteria being used to evaluate their submissions
  * [ ] Communication channels for questions and collaboration
  * [ ] A mechanism to submit their code/design contributions for review
* [ ] After submissions have been received, submissions are reviewed by a feedback panel consisting of:
  * [ ] Stakeholders from the federal government
  * [ ] Simpler.Grants.gov project maintainers
* [ ] Following the review and feedback period, a subset (or all) of the public participant teams have received a financial reward for their submissions
* [ ] Following the review and feedback period, a subset (or all) of the public participants teams are provided a mechanism to offer feedback on the event
* [ ] A playbook is created that documents how to plan and host similar events in the future. This playbook includes guidance on how to:
  * [ ] Select and configure tools to facilitate things like registration, collaboration, and voting
  * [ ] Budget and distribute rewards for challenge submissions
* [ ] Our desired deliverable metrics are captured and displayed in a public place

#### **Nice to have**

* [ ] Participants can access to all of the data they need to build their submissions via API endpoint
* [ ] Participants can prepare their submission using a template repository and/or Figma board that the simpler.grants.gov team has created for the event
* [ ] The event is extended beyond a code challenge and open to design submissions as well
* [ ] The event is promoted across our main communication channels (e.g. mailing list, static site, Slack, public wiki, etc.)
* [ ] The playbook contains recommendations on how to effectively the event and increase participation
* [ ] Following the event, submissions are reviewed by a feedback panel consisting of:
  * [ ] Participants from the co-design group
* [ ] Create a queue or waitlist for the next code/design challenge when we reach capacity for this code challenge
* [ ] The event will have an accessibility specialist based on participant needs (e.g., this could include sign language or closed captioning at the event)

### Proposed metrics

* Total number of registrations for the event
* Total number of active participants during the event
* Total number of code submissions

**Nice-to-have:**&#x20;

Engagement metrics for announcements about the event, for example:

* Total number of views for event-related pages on the static site and wiki

### Assumptions and dependencies

What functionality do we expect to be in place _**before**_ work starts on this deliverable?

* We will need to ensure that the data needed to build or prototype new functionality are made available.
* Design assets and guidelines (logos, colors, etc.) for simpler.grants.gov are made available. If they are not made available for public use, we should continue with the deliverable.

Is there any notable functionality we do _**not**_ expect to be in place before works starts on this deliverable?

* We will be using communication tools we already have procured and implemented on the simpler.grants.gov project.&#x20;
* We will not cross-pollinate the Co-Design Group and open source community from the beginning as we are establishing both for the first time and want to reduce complexity.

### Not in scope

List of functionality or features that are explicitly out of scope for this deliverable.

* It is not a requirement for the challenge to produce usable code that our project maintainers can use

### Open questions

<details>

<summary>Will the challenge be hosted virtually or do we anticipate an in-person component?</summary>

This will be determined when we start the "technical" specification and planning of this event.

</details>

<details>

<summary>Will the full text of opportunities be available via API prior to this deliverable?</summary>

We should not have it be a blocker for this deliverable

</details>



## Change log

Major updates to the content of this page will be added here.

<table><thead><tr><th>Date</th><th width="246">Update</th><th>Notes</th></tr></thead><tbody><tr><td>2/12/2024</td><td>Initial Content</td><td>Updated with Initial content</td></tr><tr><td></td><td>Updated draft 2 of the spec</td><td><ul><li>Removed technical description. It will be included in the technical specification documentation</li><li>Update the DoD</li></ul></td></tr><tr><td>4/19/2024</td><td>Added comments to draft and reviewed.</td><td></td></tr><tr><td>4/24/2024</td><td>Updated deliverable spec</td><td><ul><li>Changed most sections of the deliverable spec - overview, user stories, DoD, proposed metrics to reflect the smaller, "scrappy" code challenge that we shifted to</li><li>Removed the technical description section which will be added in the tech spec of the code challenge</li></ul></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr></tbody></table>
