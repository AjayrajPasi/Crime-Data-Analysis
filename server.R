
function(input,output,session){
  
  output$dataT1<-renderDataTable(
    crime17
      
  )
  output$dataT2<-renderDataTable(
    crime18
    
  )
  output$str1<-renderPrint(
    crime17 %>%
      str()
    
  )
  output$str2<-renderPrint(
    crime18 %>%
      str()
    
  )
  output$summary1<-renderPrint(
    crime17 %>%
      summary()
  )
  output$summary2<-renderPrint(
    crime18 %>%
      summary()
  )
  
  output$bar1<-renderPlotly({
    plot <- plot_ly(data = crime17, x = ~reorder(state_ut,-total_victims), y = ~total_victims,  type = "bar", mode = "markers")
    plot <- plot %>% add_markers(color = ~state_ut, size = ~total_victims * 2)
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "Total victims"),  
                            title = "Rape cases in (2017)")
  })
  output$bar2<-renderPlotly({
    plot <- plot_ly(data = crime18, x = ~reorder(state_ut,-total_victims), y = ~total_victims,  type = "bar", mode = "markers")
    plot <- plot %>% add_markers(color = ~state_ut, size = ~total_victims * 2)
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "Total victims"),  
                            title = "Rape cases in (2018)")
  })
  output$sca1<-renderPlotly({
    plot <- plot_ly(data = crime17, x = ~reorder(state_ut,-total_victims), y = ~below_18,name = "below 18",  type = "scatter", mode = "markers")
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "Total victims"),  
                            title = "Rape cases in (2017)")
    plot<-plot %>% add_trace(y=~above_18,name="above 18",mode ="markers")
  })
  output$sca2<-renderPlotly({
    plot <- plot_ly(data = crime18, x = ~reorder(state_ut,-total_victims), y = ~below_18,name = "below 18",  type = "scatter", mode = "markers")
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "Total victims"),  
                            title = "Rape cases in (2018)")
    plot<-plot %>% add_trace(y=~above_18,name="above 18",mode ="markers")
  })
  output$rel1<-renderPlotly({
    plot <- plot_ly(data = crime17, x = ~reorder(state_ut,-total_victims), y = ~total_victims,name = "Total Victims",  type = "bar", mode = "markers")
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "Total victims & Reported Cases"),  
                            title = "Rape cases in (2017)")
    plot<-plot %>% add_trace(y=~reported_cases,name="cases reported",mode ="markers")
  })
  output$rel2<-renderPlotly({
    plot <- plot_ly(data = crime18, x = ~reorder(state_ut,-total_victims), y = ~total_victims,name = "Total Victims",  type = "bar", mode = "markers")
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "Total victims & Reported Cases"),  
                            title = "Rape cases in (2018)")
    plot<-plot %>% add_trace(y=~reported_cases,name="cases reported",mode ="marker")
  })
  output$rl1<-renderPlotly({
    plot <- plot_ly(data = crime2017, x = ~reorder(State.UT,-Total.Victims), y = ~Below.6.Years,name = "Below 6",  type = "bar", mode = "markers")
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "No of Victims"),  
                            title = "Rape cases in (2017)")
    plot<-plot %>% add_trace(y=~X6.....12.Years,name="6 to 12",mode ="marker")
    plot<-plot %>% add_trace(y=~X12....16.Years,name="12 to 16",mode ="marker")
    plot<-plot %>% add_trace(y=~X16...18.Years,name="16 to 18",mode ="marker")
    plot<-plot %>% add_trace(y=~X18..30.Years,name="18 to 30",mode ="marker")
    plot<-plot %>% add_trace(y=~X30...45.Years,name="30 to 45",mode ="marker")
    plot<-plot %>% add_trace(y=~X45...60.Years,name="45 to 60",mode ="marker")
    plot<-plot %>% add_trace(y=~Above.60.Years,name="Above 60",mode ="marker")
  })
  output$rl2<-renderPlotly({
    plot <- plot_ly(data = crime2018, x = ~reorder(State.UT,-Total.Victims), y = ~Below.6.Years,name = "Below 6",  type = "bar", mode = "markers")
    plot <- plot %>% layout(xaxis = list(title = "State & UT"),  
                            yaxis = list(title = "No of Victims"),  
                            title = "Rape cases in (2018)")
    plot<-plot %>% add_trace(y=~X6.....12.Years,name="6 to 12",mode ="marker")
    plot<-plot %>% add_trace(y=~X12....16.Years,name="12 to 16",mode ="marker")
    plot<-plot %>% add_trace(y=~X16...18.Years,name="16 to 18",mode ="marker")
    plot<-plot %>% add_trace(y=~X18..30.Years,name="18 to 30",mode ="marker")
    plot<-plot %>% add_trace(y=~X30...45.Years,name="30 to 45",mode ="marker")
    plot<-plot %>% add_trace(y=~X45...60.Years,name="45 to 60",mode ="marker")
    plot<-plot %>% add_trace(y=~Above.60.Years,name="Above 60",mode ="marker")
  })
  output$pie1<-renderPlotly({
    plot<-plot_ly(merged , labels = ~Year , values = ~Cases.Reported , type = "pie" )
    plot<-plot %>% layout(title = "Reported Cases", 
                          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE) , 
                          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  output$pie2<-renderPlotly({
    plot<-plot_ly(merged , labels = ~Year , values = ~Total.Victims , type = "pie" )
    plot<-plot %>% layout(title = "No of victims", 
                          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE) , 
                          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  

}