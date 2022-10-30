provider "todoist" {
    api_key     = "" 
}

resource "todoist_task" "deploy" {
    content             = "Deploy change request"
    due_string          = "Weekday"
    responsible_uid     = "marcelo"
    completed           = false 
}