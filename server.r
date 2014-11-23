library(shiny)

Lon<-function(ud2){
        if(length(ud2)>=2){
                print("Please select only one unit to convert")
        }
        else ud2
}
tempConv<-function(temp1,ud1,ud2){
                if(length(ud2)>=2){
                        stop("Please select only one unit to convert")
                }
                else {
        
                        if(ud1=="C"& ud2=="F"){
                                temp2<-(temp1*(9/5))+32
                        }
                        if(ud1=="F"& ud2=="C"){
                                temp2<-(temp1-32)*(5/9)
                        }
                        if(ud1=="C"& ud2=="K"){
                                temp2<-temp1+273.15
                        }
                        if(ud1=="K"& ud2=="C"){
                                temp2<-temp1-273.15
                         }
                        if(ud1=="F"& ud2=="K"){
                               temp2<-((temp1-32)*(5/9))+273.15
                        }
                        if(ud1=="K"& ud2=="F"){
                             temp2<-((temp1-273.15)*(9/5))+32
                        }
                        if(ud1=="C"& ud2=="C"){
                              temp2<-temp1
                        }
                        if(ud1=="F"& ud2=="F"){
                               temp2<-temp1
                        }
                        if(ud1=="K"& ud2=="K"){
                             temp2<-temp1
                        }
                        paste(round(temp2,digits=2),ud2)
}}


shinyServer(
        function(input,output){
             output$otemp1<-renderPrint({input$temp1})
             output$oud1<-renderPrint({input$ud1})
             output$oud2<-renderPrint({Lon(input$ud2)})
             output$prediction<-renderPrint({
                     input$goButton
                     isolate (tempConv(input$temp1,input$ud1,input$ud2))
                     })
             output$otext<-renderPrint({paste(input$text,", Thanks for your appreciation.")})
        }
)