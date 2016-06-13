job "paas-monitor" {
	type= "system"
	# Job should run in the US region
    	region = "jesus"

    	# Spread tasks between us-west-1 and us-east-1
    	datacenters = ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
	group "paas-monitor-group" {
		count = 1
		task "paas-monitor" {
			driver = "docker"
			#port "80" {}
			config {
				image = "xebia/paas-monitor:1.0.0"
				port_map {
						http = 80
				}
			}
			resources {
				cpu = 100
				memory = 128
				network {
					mbits = 10
					port "http" {}
				}
		  	}
		}
	}

  	constraint {
                                 attribute = "${attr.kernel.name}"
                                 operator = "is" # defaults to equality where =, == and is are equivalent
                                value = "linux"
                                }
}
