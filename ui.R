library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Rape cases in India(2017-2018)",
                  titleWidth = 400,
                  tags$li(class="dropdown",tags$a(href="https://www.kaggle.com/datasets/nehaprabhavalkar/crime-in-india?select=Victims+of+Rape",icon("kaggle")," Data Source"))),
  dashboardSidebar(
    sidebarMenu(
      id="sidebar",
      menuItem("Dataset",tabName = "data",icon = icon("database")),
      menuItem("Visualization 1",tabName = "viz1",icon = icon("chart-line")),
      menuItem("Visualization 2",tabName = "viz2",icon = icon("chart-line")),
      menuItem("Summary",tabName = "info",icon = icon("info"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "data",
              tabBox(id="t1",width = 12,
                     tabPanel("Overview",icon = icon("address-card"),fluidRow(
                       column(width=7,
                              tags$img(src="rape.png",width=550,height=400),
                              tags$br(),
                              tags$a("Pic from Google"),align="center"),
                       column(width=4,tags$br(),
                              tags$p(h4("Sexual violence is a major problem faced by women and girls in India. 
                                     It is already a challenge for survivors to obtain justice in the Indian legal system, 
                                     and those from the country’s marginalized communities face even more major barriers.
                                     Survivors of sexual violence face huge barriers in accessing justice, 
                                     including community pressure to drop the case, 
                                     discriminatory attitudes of police and judicial officers, 
                                     insufficient legal aid, and discouraging conviction rates. 
                                     These challenges are often magnified if the survivors are members of India’s marginalized communities, 
                                     particularly if they are Dalits, Adivasis, or Muslims."))
                              
                              )
                       
                     )),
                     tabPanel("Data",icon = icon("address-card"),dataTableOutput("dataT1"),dataTableOutput("dataT2")),
                     tabPanel("Structure",icon = icon("address-card"),verbatimTextOutput("str1"),verbatimTextOutput("str2")),
                     tabPanel("Data_Summary",icon = icon("address-card"),verbatimTextOutput("summary1"),verbatimTextOutput("summary2"))
                    )
              ),
      tabItem(tabName = "viz1",
              tabBox(id="t2",width = 12,
                     tabPanel("No of Victims",plotlyOutput("bar1"),tags$br(),plotlyOutput("bar2")),
                     tabPanel("Below and above 18",plotlyOutput("sca1"),tags$br(),plotlyOutput("sca2"))
                     
                     )
              ),
      tabItem(tabName = "viz2",
              tabBox(id="t3",width = 12,
                     tabPanel("Age Group",plotlyOutput("rl1"),tags$br(),plotlyOutput("rl2")),
                     tabPanel("Relationship",
                              fluidRow(
                                column(width=12,plotlyOutput("rel1"),tags$br(),plotlyOutput("rel2")),
                                tags$br(),
                                column(width=6,plotlyOutput("pie1")),
                                column(width=6,plotlyOutput("pie2"))
                              ))
                     )
              ),
      tabItem(tabName ="info",
              tabBox(id="t4",width = 12,
                     tabPanel("Overall Summary",icon = icon("address-card"),
                              fluidRow(column(width=12,
                                              tags$p(h2("1. By data summary we Observed that madhya pradesh , 
                                                            Rajasthan and uttarpradesh were 3 most unsafe states in 2017-18 ")),
                                              tags$br(),
                                              tags$p(h2("2. In 2018 more cases reported as compare to 2017.")),
                                              tags$br(),
                                              tags$p(h2("3. In 2018 below 18 rape cases were less compare to 2017")),
                                              tags$br(),
                                              tags$p(h2("4. Most of victims were between 18-30"))
                                              )
                                       )
                              )))
    )
  )
)

