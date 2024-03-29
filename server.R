library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinyWidgets)


# Define server logic
server <- function(input, output, session) {
  observeEvent(input$signInBtn, {
    showModal(modalDialog(
      id = "signInModal", title = "Sign In",
      textInput("email", "Email:"),
      passwordInput("password", "Password:"),
      actionButton("loginBtn", "Log In")
    ))
  })
  
  observeEvent(input$signUpBtn, {
    showModal(modalDialog(
      id = "signUpModal", title = "Sign Up",
      textInput("fullname", "Full Name:"),
      textInput("email_signup", "Email:"),
      passwordInput("password_signup", "Password:"),
      textInput("postalcode", "Postal Code:"),
      actionButton("submitBtn", "Submit")
    ))
  })
  redirected <- reactiveVal(FALSE)
  observeEvent(input$loginBtn, {
    if (!redirected()) {
      # Redirect to chatbot API URL
      js <- sprintf("window.location.href = 'https://new-interface-bedfc8.zapier.app/chatbot';")
      runjs(js)
      # Update redirection status
      redirected(TRUE)
    } else {
      # Display message if already redirected
      output$result <- renderText("You have already been redirected to the chatbot.")
    }
  })
  redirected <- reactiveVal(FALSE)
  observeEvent(input$submitBtn, {
    if (!redirected()) {
      # Redirect to chatbot API URL
      js <- sprintf("window.location.href = 'https://new-interface-bedfc8.zapier.app/chatbot';")
      runjs(js)
      # Update redirection status
      redirected(TRUE)
    } else {
      # Display message if already redirected
      output$result <- renderText("You have already been redirected to the chatbot.")
    }
  })
  
}


