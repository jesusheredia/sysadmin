job "paas-monitor" {
	type= "service"    
	# Job should run in the US region
    	region = "jesus"

    	# Spread tasks between us-west-1 and us-east-1
    	datacenters = ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
	group "paas-monitor-group" {
		count = 2
		task "paas-monitor" {
			driver = "docker"
			config {
				image = "xebia/paas-monitor:1.0.0"
			}
			resources {
				cpu = 100
				memory = 128
				network {
					mbits = 10
				}
		  	}
		}
	}
}

