# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


variable "project" {}


variable "location" {}
variable "region" {}

variable "labels" {}

# DataProc cluster configuration
variable "cluster_name" {}

variable "staging_bucket" {}

variable "cluster_version" {}

variable "kms_key_name" {}

variable "master_instance_type" {
   #"n1-standard-4"
}

variable "master_disk_type" {
  #"pd-standard"
}

variable "master_disk_size" {
 #100
}

variable "master_local_ssd" {
  #0
}

variable "master_ha" {
  #bool
  #false
}

variable "worker_instance_type" {
  #"n1-standard-4"
}

variable "primary_worker_min_instances" {
  #2
}

variable "primary_worker_max_instances" {
 #10
}

variable "preemptible_worker_instance_type" {
  #"n1-standard-4"
}

variable "preemptible_worker_min_instances" {
  #2
}

variable "preemptible_worker_max_instances" {
  #10
}

variable "worker_disk_type" {
  #"pd-standard"
}

variable "worker_disk_size" {
  #100
}

variable "worker_accelerator" {
  type = list(object({
    count = number
    type = string
  }))
  description = "The number and type of the accelerator cards exposed to this instance. "
  default = []
}

variable "worker_local_ssd" {
  type = number
  description = "The amount of local SSD disks that will be attached to each worker cluster node."
  default = 0
}

variable "network" {
  type = string
  description = "The name or self_link of the Google Compute Engine network to the cluster will be part of. Conflicts with subnetwork. If neither is specified, this defaults to the 'default' network."
}

variable "service_account" {
  type = string
  description = "The service account for the cluster"
  default = ""
}

variable "zone" {
  type = string
  description = "The GCP zone where your data is stored and used"
  default = "europe-west1-b"
}

variable "scale_up_factor" {
  type = number
  description = "Fraction of average pending memory in the last cooldown period for which to add workers. A scale-up factor of 1.0 will result in scaling up so that there is no pending memory remaining after the update (more aggressive scaling). A scale-up factor closer to 0 will result in a smaller magnitude of scaling up (less aggressive scaling). Bounds: [0.0, 1.0]."
  default = 0.5
}

variable "scale_up_min_worker_fraction" {
  type = number
  description = " Minimum scale-up threshold as a fraction of total cluster size before scaling occurs. For example, in a 20-worker cluster, a threshold of 0.1 means the autoscaler must recommend at least a 2-worker scale-up for the cluster to scale. A threshold of 0 means the autoscaler will scale up on any recommended change. Bounds: [0.0, 1.0]"
  default = 0.0
}

variable "scale_down_factor" {
  type = number
  description = "Fraction of average pending memory in the last cooldown period for which to remove workers. A scale-down factor of 1 will result in scaling down so that there is no available memory remaining after the update (more aggressive scaling). A scale-down factor of 0 disables removing workers, which can be beneficial for autoscaling a single job. Bounds: [0.0, 1.0]."
  default = 1.0
}

variable "scale_down_min_worker_fraction" {
  type = number
  description = "Minimum scale-down threshold as a fraction of total cluster size before scaling occurs. For example, in a 20-worker cluster, a threshold of 0.1 means the autoscaler must recommend at least a 2 worker scale-down for the cluster to scale. A threshold of 0 means the autoscaler will scale down on any recommended change. Bounds: [0.0, 1.0]."
  default = 0.0
}

variable "cooldown_period" {
  type = string
  description = "Duration between scaling events. A scaling period starts after the update operation from the previous event has completed. Bounds: [2m, 1d]."
  default = "120s"
}

variable "graceful_decommission_timeout" {
  type = string
  description = "Timeout for YARN graceful decommissioning of Node Managers. Specifies the duration to wait for jobs to complete before forcefully removing workers (and potentially interrupting jobs). Only applicable to downscaling operations. Bounds: [0s, 1d]."
  default = "300s"
}

variable "conda_packages" {
  type = string
  description = "A space separated list of conda packages to be installed"
  default = ""
}

variable "pip_packages" {
  type = string
  description = "A space separated list of pip packages to be installed"
  default = ""
}

variable "conda_initialization_script" {
  type = string
  description = "Location of script in GS used to install conda packages (https://github.com/GoogleCloudPlatform/dataproc-initialization-actions)"
  default = "gs://dataproc-initialization-actions/python/conda-install.sh"
}

variable "pip_initialization_script" {
  type = string
  description = "Location of script in GS used to install pip packages (https://github.com/GoogleCloudPlatform/dataproc-initialization-actions)"
  default = "gs://dataproc-initialization-actions/python/pip-install.sh"
}

variable "initialization_script" {
  type = list(string)
  description = "List of additional initialization scripts"
  default = []
}

variable "initialization_timeout_sec" {
  type = number
  description = "The maximum duration (in seconds) which script is allowed to take to execute its action."
  default = 300
}

