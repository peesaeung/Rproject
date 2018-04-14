require(readxl)
Copy_of_2017_cost =
  read_excel("Desktop/Data Science/performance/Copy of 2017_cost - Copy.xlsx", sheet = "Cost'17", 
             col_types = c("text", "date", "skip", "skip", "skip", "text", "skip", "skip", "text","skip", "text", 
                           "text", "text", "text", "text", "text", "skip", "text", "text", "skip", "skip", "text", 
                           "text", "numeric", "numeric", "numeric"))
require(plyr)
cost=count(Copy_of_2017_cost)
cost_by_cust_per_month=count(cost,vars=c("IB.Serial.Number","Year.Month"),wt_var = "Cost")
cost_by_model_per_month=count(cost,vars=c("IB.Product.L6","Year.Month"),wt_var="Cost")
cost_by_group_per_month=count(cost,vars=c("GL4","Year.Month"),wt_var="Cost")
cost_by_type_per_month=count(cost,vars=c("GL2","Year.Month"),wt_var="Cost")
require(ggplot2)
#g1=ggplot(cost_by_cust_per_month,aes(x=Year.Month,y=freq))+geom_point()+facet_wrap(~IB.Serial.Number)
g2=ggplot(cost_by_model_per_month,aes(x=Year.Month,y=freq))+geom_col()+facet_wrap(~IB.Product.L6)
g3=ggplot(cost_by_group_per_month,aes(x=Year.Month,y=freq))+geom_col()+facet_wrap(~GL4)
g4=ggplot(cost_by_type_per_month,aes(x=Year.Month,y=freq))+geom_col()+facet_wrap(~GL2)

#g5=ggplot(cost_by_cust_per_month,aes(x=Year.Month,y=freq))+geom_col(aes(color=IB.Serial.Number))
g6=ggplot(cost_by_model_per_month,aes(x=Year.Month,y=freq))+geom_col(aes(fill=IB.Product.L6))
g7=ggplot(cost_by_group_per_month,aes(x=Year.Month,y=freq))+geom_col(aes(fill=GL4))
g8=ggplot(cost_by_type_per_month,aes(x=Year.Month,y=freq))+geom_col(aes(fill=GL2))

g2
g3
g4

g6
g7
g8
