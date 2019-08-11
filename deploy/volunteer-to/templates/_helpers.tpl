{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "volunteer-to.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "volunteer-to.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "volunteer-to.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Provide standard resource labels.
*/}}
{{ define "volunteer-to.metadataLabels" }}
  app: {{ template "volunteer-to.name" . }}
  chart: {{ template "volunteer-to.chart" . }}
  instance: {{ .Release.Name }}
  managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Image value hack for skaffold.
*/}}
{{- define "volunteer-to.api.image" -}}
{{- if .Values.api.image.tag -}}
{{- printf "%s:%s" .Values.api.image.repository .Values.api.image.tag -}}
{{- else -}}
{{- .Values.api.image.repository -}}
{{- end -}}
{{- end -}}

{{- define "volunteer-to.db.image" -}}
{{- if .Values.db.image.tag -}}
{{- printf "%s:%s" .Values.db.image.repository .Values.db.image.tag -}}
{{- else -}}
{{- .Values.db.image.repository -}}
{{- end -}}
{{- end -}}
