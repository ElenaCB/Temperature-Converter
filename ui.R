library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Temperature Converter"),
        sidebarPanel(
                p('Given a temperature in Celsius, Fahrenheit or Kelvin, and the units to convert (Celsius or Fahrenheit or Kelvin) said temperature, this app takes that information and uses some basic mathematical equations for the conversion to requested unit.'),
                p('For example convert 68 grades Fahrenheit to grades Celsius, and the program will give the answer 20 º C.'),
                p('Note, the app only converts one unit at a time.'),
                numericInput("temp1",
                             label=h2("Temperature"),
                             value=-40,min=-250,max=1000,step=5),
                radioButtons("ud1",label=h2('Units'),
                             choices=list("Celsius(ºC)"="C",
                                     "Fahrenheit(ºF)"="F",
                                     "Kelvin(ºK)"="K"
                                   ), selected="C"
                ),
                checkboxGroupInput("ud2",label=h2('Convert to'),
                                   c("Celsius(ºC)"="C",
                                     "Fahrenheit(ºF)"="F",
                                     "Kelvin(ºK)"="K"
                                   ), selected="F"
                ),
                actionButton("goButton","Calculate"),
                textInput("text", label = h3("Do you like the app?"), 
                          value = "Yes/No")
                ),
        mainPanel(
                h3('Results of the conversion'),
                h4('You entered'),
                verbatimTextOutput("otemp1"),
                h4('in'),
                verbatimTextOutput("oud1"),
                h4('Convert to'),
                verbatimTextOutput("oud2"),
                h3('Conversion'),
                verbatimTextOutput("prediction"),
                h2("Your opinion"),
                verbatimTextOutput("otext")
                )
        )
)