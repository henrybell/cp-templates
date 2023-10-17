# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

env

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export COMPUTE_SERVICE_ACCOUNT=$(gcloud projects describe ${PROJECT_ID} --format="value(projectNumber)")-compute@developer.gserviceaccount.com

gcloud infra-manager deployments apply projects/${PROJECT_ID}/locations/${REGION}/deployments/${DEPLOYMENT_NAME} \
     --service-account=projects/${PROJECT_ID}/serviceAccounts/${COMPUTE_SERVICE_ACCOUNT} \
     --local-source=terraform \
    --input-values=project_id=${PROJECT_ID},region=${REGION},cluster_id=${DEPLOYMENT_NAME}