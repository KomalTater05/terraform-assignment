- terraform-assignment
## AKS Cluster Creation
## Create a EKS cluster with Auto Scaling enabled and store the backend in s3( for 2 envs like dev, qa).

THe steps followed are :-
- Created a vpc with 2 public subnets and an internet gateway (to make the vpc accessible to the internet) and route table
- <img width="959" alt="image" src="https://github.com/KomalTater05/terraform-assignment/assets/155729023/7eaf71ed-88bc-40bd-b569-a67c152d435c">
- Create an EKS cluster add it in proper subnets
- Create an IAM role for the EKS cluster and attach the required policies to it
- Here need to have  difeerent environment :
       - Default(dev environment)
       - QA environment
  - Implemented the different environmnet using the worksapce approach
  - <img width="960" alt="image" src="https://github.com/KomalTater05/terraform-assignment/assets/155729023/7b980685-f88b-4073-8bad-16cadbbcc40c">
- <img width="960" alt="image" src="https://github.com/KomalTater05/terraform-assignment/assets/155729023/653a9b00-f603-4d0d-a797-c0710517844c">
# Cluster in dev worksapce
- <img width="960" alt="image" src="https://github.com/KomalTater05/terraform-assignment/assets/155729023/f71e7728-0bf3-416f-b69c-26f64b198114">
# Cluster in qa workspace
- <img width="955" alt="image" src="https://github.com/KomalTater05/terraform-assignment/assets/155729023/cf6cb873-5c59-4fa5-8039-4c8fa6d39ebf">
