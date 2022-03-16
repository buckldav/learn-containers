# Scaling w/k8s

## Horizontal vs. Vertical Scaling

[Horizontal vs. Vertical Scaling](https://www.section.io/blog/scaling-horizontally-vs-vertically/)
Vertical scaling is adding computing and storage resources. Horizontal scaling is being able to split your services so that more can run in parallel.

## Scaling Node.js on k8s

- [Node.js + k8s](https://learnk8s.io/scaling-nodejs-kubernetes)
- [Strapi official k8s tutorial](https://strapi.io/blog/deploying-and-scaling-the-official-strapi-demo-app-foodadvisor-with-kubernetes)

## RBAC w/Strapi

- [Custom Roles and Permissions](https://strapi.io/features/custom-roles-and-permissions)
- [Multiple database connections difficult](https://forum.strapi.io/t/multiple-database-connections-in-strapi-v4/15321)

## Pros and Cons of Single vs. Multi Instance Strapi

| Feature | Single | Multi |
|-|-|-|
| Less overhead | &check; | |
| Maintainability | &check; | |
| Horizontal scalability | | &check; |
| Customizability | | &check; |
| Data segregation** | | &check; |

\*\*Single and multi would go about data segregation in different ways; single would do it through user roles, multi would do it by having separate instances and databases. 
That would be the easiest way to segregate data for each IMHO. I think multi has the edge here but both do the job.
