terraform { 
  backend "gcs" { 
    bucket  = "tf_remote_state_amkdiss_test" 
    credentials = "../auth/service-key/service-key.json"
  } 
} 
