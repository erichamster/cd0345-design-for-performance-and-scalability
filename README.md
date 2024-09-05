# Cloud Developer ND Course 2: Design for Performance and Scalability

---

## Project  Instructions

### Exercise 1

1. Download the [starter code](https://github.com/udacity/cand-c2-project).
2. In the main.tf file write the code to provision
   * AWS as the cloud provider
   * Use an existing VPC ID
   * Use an existing public subnet
   * 4 AWS t2.micro EC2 instances named Udacity T2
   * 2 m4.large EC2 instances named Udacity M4
3. Run Terraform. 
4. Take a screenshot of the 6 EC2 instances in the AWS console and save it as `Terraform_1_1`. 
5. Use Terraform to  delete the 2 m4.large instances 
6. Take an updated screenshot of the AWS console showing only the 4 t2.micro instances and save it as `Terraform_1_2`

### Exercise 2

1. In the  Exercise_2 folder, write the code to deploy an AWS Lambda Function using Terraform. Your code should include:

   * A lambda.py file
   * A main.tf file with AWS as the provider, and IAM role for Lambda, a VPC, and a public subnet
   * An outputs.tf file
   * A variables.tf file with an AWS region
  
2. Take a screenshot of the EC2 instances page
3. Take a screenshot of the VPC page

## Project Files
- `Exercise_1`: Contains the terraform code to create EC2 instances in AWS.
- `Exercise_2`: Contains code to deploy lamda function in AWS.
- `screenshots`: This folder contains all the screenshots taken at time of doing project.
- `Udacity_Diagram_1.pdf`: Contains a cost-effective AWS infrastructure architecture for a new social media application development project for 50,000 single-region users.
- `Udacity_Diagram_2.pdf`: Contains a SERVERLESS architecture schematic for a new application development project.
- `Initial_Cost_Estimate.csv`: Cost estimated using [AWS Pricing Calculator](https://calculator.aws/#/) for the architecture to run in AWS created in `Udacity_Diagram_1.pdf`.
    - Targeted a monthly estimate between $8,000-$10,000.
- `Reduced_Cost_Estimate.csv`: Cost estimated using [AWS Pricing Calculator](https://calculator.aws/#/) for the architecture to run in AWS created in `Udacity_Diagram_1.pdf`.
    - Targeted a monthly estimate to a maximum of $6,500.
- `Increased_Cost Estimate.csv`: Cost estimated using [AWS Pricing Calculator](https://calculator.aws/#/) for the architecture to run in AWS created in `Udacity_Diagram_1.pdf`.
    - Targeted a monthly estimate to a maximum of $20,000.

### How I reduced the estimate to $6,500

Below is the list of changes and reasons for the solution:

- `Changed`: Scaled down to lower configuration EC2 instance type`(t2.xlarge -> t2.large)`.
    - **Reason**: Changing the EC2 instance configuration can effect the performance for a little bit but instances can be auto scaled if and when needed.
- `Changed`: Changed pricing from on-demand to reserved instances.
    - **Reason**: Reserving instances for 1 year will reduce the cost for the architecture. But it will lock the application platform to use the same infrastrcuture for one year. Although more resources can be added any time if and when needed.
- `Changed`: Scaled down RDS instance from `db.m5.4xlarge to db.m5.2xlarge`.
    - **Reason**: Scaling down will have the database performance issue but it can be bearable according to the application requirements.
    
### How I come up with an estimated cost of $20,000

Below is the list of changes and reasons for the solution:

- `Changed`: Added more EC2 instances and load balancer.
    - **Reason**: This will provide high availability for the application. Even if `Northern Virginia` region is completely down, application will be up and running in `Ohio` region.
- `Changed`: Added RDS database instance in `Ohio` region.
    - **Reason**: This will reduce the latency for users accessing application in other region. Because data can be fetched from `Ohio` region read replica RDS database instance.
- `Changed`: Scaled up RDS database instances.
    - **Reason**: This will improve the database performance and will be more effecting in case of huge traffic on application platform.