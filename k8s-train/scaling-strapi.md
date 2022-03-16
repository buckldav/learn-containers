# Scaling Strapi w/k8s

## Horizontal vs. Vertical Scaling

[Horizontal vs. Vertical Scaling](https://www.section.io/blog/scaling-horizontally-vs-vertically/)
Vertical scaling is adding computing and storage resources. Horizontal scaling is being able to split your services so that more can run in parallel.

## Scaling Node.js on k8s

- [Node.js + k8s](https://learnk8s.io/scaling-nodejs-kubernetes)
- [Strapi official k8s tutorial](https://strapi.io/blog/deploying-and-scaling-the-official-strapi-demo-app-foodadvisor-with-kubernetes)

## RBAC w/Strapi

- [Administrator Roles](https://docs.strapi.io/user-docs/latest/users-roles-permissions/configuring-administrator-roles.html)
- [Multiple database connections difficult](https://forum.strapi.io/t/multiple-database-connections-in-strapi-v4/15321)

## Pros and Cons of Single vs. Multi Instance Strapi

| Feature | Single | Multi |
|-|-|-|
| Less overhead | &check; | |
| Maintainability* | &check; | &check; |
| Horizontal scalability | | &check; |
| Customizability per client | | &check; |
| Data segregation** | &check; | &check; |

\* Single would mean one (or few) instances to maintain and upgrade. Single would require more customization on top of what Strapi provides out of the box to ensure that we segregate things properly with the API. Multi would require us to update dependencies across many instances. Both apporaches have pros and cons. A hybrid approach (e.g. ~50 clients per instance) could mean the worst of both worlds, where customization is needed and we still end up with many instances to maintain.

\*\*Single and multi would go about data segregation in different ways; single would do it through user roles, multi would do it by having separate instances and databases. 
That would be the easiest way to segregate data for each IMHO. I think multi has the edge here but both do the job.
