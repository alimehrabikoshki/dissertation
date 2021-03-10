terraform { 
  backend "gcs" { 
    bucket  = "tf_remote_state_amkdiss_test" 
    credentials = "/mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/service-key/service-key.json"
  } 
} 
