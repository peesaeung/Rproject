require(readxl)
Copy_of_2017_cost =
  read_excel("Desktop/Data Science/performance/Copy of 2017_cost - Copy.xlsx", sheet = "Cost'17", 
             col_types = c("text", "date", "skip", "skip", "skip", "text", "skip", "skip", "text","skip", "text", 
                           "text", "text", "text", "text", "text", "skip", "text", "text", "skip", "skip", "text", 
                           "text", "numeric", "numeric", "numeric"))

require(plyr)
cost=count(Copy_of_2017_cost)
#cost_by_cust_per_month=count(cost,vars=c("IB.Serial.Number","Year.Month"),wt_var = "Cost")
#cost_by_model_per_month=count(cost,vars=c("IB.Product.L6","Year.Month"),wt_var="Cost")
#cost_by_group_per_month=count(cost,vars=c("GL4","Year.Month"),wt_var="Cost")
#cost_by_type_per_month=count(cost,vars=c("GL2","Year.Month"),wt_var="Cost")

require(ggplot2)
#ggplot(cost_by_model_per_month,aes(x=Year.Month))+geom_bar()+facet_wrap(~IB.Product.L6)
#ggplot(cost_by_group_per_month,aes(x=Year.Month))+geom_bar()+facet_wrap(~GL4)
#ggplot(cost_by_type_per_month,aes(x=Year.Month,y=freq))+geom_col()+facet_wrap(~GL2)

#ggplot(cost_by_model_per_month,aes(x=Year.Month,y=freq,fill=IB.Product.L6))+geom_col()
#ggplot(cost_by_group_per_month,aes(x=Year.Month,y=freq,fill=GL4))+geom_col(position = "dodge")
#ggplot(cost_by_type_per_month,aes(x=Year.Month,y=freq,fill=GL2))+geom_col(position = "dodge")

#ggplot(cost_by_model_per_month,aes(x=Year.Month,y=freq))+geom_count(aes(color=IB.Product.L6))
#ggplot(cost_by_group_per_month,aes(x=Year.Month,y=freq))+geom_count(aes(color=GL4))
#ggplot(cost_by_type_per_month,aes(x=Year.Month,y=freq))+geom_density(aes(fill=GL2))

ggplot(cost,aes(x=Year.Month,y=Cost*freq,fill=GL2))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+labs(y="Cost",title="Material cost compare by Type")
ggplot(cost,aes(x=Year.Month,y=Cost*freq,fill=GL4))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+labs(y="Cost",title="Material cost compare by Detailed Type")
#ggplot(cost,aes(x=Item.Product.Line,y=Cost*freq,fill=GL2))+geom_bar(stat="summary",fun.y="sum",position = "dodge")
ggplot(cost,aes(x=Year.Month,y=Cost*freq,fill=GL2))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+facet_wrap(~Item.Product.Line)+labs(y="Cost",title="Material cost compare by Type, Seperated by Material type")
ggplot(cost,aes(x=Year.Month,y=Cost*freq,fill=GL4))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+facet_wrap(~Item.Product.Line)+labs(y="Cost",title="Material cost compare by Detailed Type, Seperated by Material type")
#ggplot(cost,aes(x=Year.Month,y=Cost*freq,fill=GL4))+geom_col(position = "dodge")+facet_wrap(~GL2)
#ggplot(cost,aes(x=Item.Product.Line,y=Cost*freq,fill=GL2))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+facet_wrap(~Year.Month)+labs(y="Cost",title="Material cost compare by Type, Seperated by Month")
#ggplot(cost,aes(x=Item.Product.Line,y=Cost*freq,fill=GL4))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+facet_wrap(~Year.Month)+labs(y="Cost",title="Material cost compare by Detailed Type, Seperated by Month")

costdrum=subset(cost,(Year.Month=="2017-08")&(Item.Product.Line=="DRUM")&(GL4=="GCS COLOUR"),select=Year.Month:freq)
ggplot(costdrum,aes(x=IB.Product.L6,y=Cost*freq,fill=IB.Product.L6))+geom_bar(stat="summary",fun.y="sum",position = "dodge",show.legend = F)+labs(y="Cost",title="Drum cost compare by Model")

drummatt=subset(costdrum,(IB.Product.L6=="MATT HIGH"),select=Year.Month:freq)
ggplot(drummatt,aes(x=IB.Serial.Number,y=Qty*freq,fill=IB.Serial.Number))+geom_bar(stat="summary",fun.y="sum",position = "dodge",show.legend = F)+labs(y="No. of Drum",title="Drum cost of Matt High")

costpart=subset(cost,(Year.Month=="2017-11")&(Item.Product.Line=="PART")&(GL4=="GCS COLOUR"),select=Year.Month:freq)
ggplot(costpart,aes(x=IB.Product.L6,y=Cost*freq,fill=IB.Product.L6))+geom_bar(stat="summary",fun.y="sum",position = "dodge",show.legend = F)+labs(y="Cost",title="Part cost compare by Model")

mattpart=subset(costpart,(IB.Product.L6=="MATT HIGH"),select=Year.Month:freq)
ggplot(mattpart,aes(x=Item.Description,y=Cost*freq,fill=Item.Description))+geom_bar(stat="summary",fun.y="sum",position = "dodge")+labs(y="Cost",title="Part cost compare by Type")
ggplot(mattpart,aes(x=IB.Serial.Number,y=Cost*freq,fill=IB.Serial.Number))+geom_bar(stat="summary",fun.y="sum",position = "dodge",show.legend = F)+labs(y="Cost",title="Part cost compare by Serial Number")

