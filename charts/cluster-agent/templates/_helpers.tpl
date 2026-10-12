{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cluster-agent.labels" -}}
helm.sh/chart: {{ include "cluster-agent.chart" . }}
{{ include "cluster-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cluster-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Name of the Secret holding registry credentials and cosign public key
*/}}
{{- define "cluster-agent.secretName" -}}
{{- default .Values.credentials.name .Values.credentials.existingSecret }}
{{- end }}
