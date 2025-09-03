# Changelog

Este archivo contiene los cambios realizados en el proyecto de infraestructura como código utilizando Terraform. Sigue el formato [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) y respeta la semántica de versiones [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

## [2.0.0] - 2025-09-03
### Agregado
- Pipeline completo de CI/CD con GitHub Actions para Terraform.
- Acción personalizada para autenticación con Azure CLI mediante device code.
- Acción personalizada para gestión de workspaces de Terraform.
- Integración con herramientas de validación: TFLint, Checkov y terraform-docs.
- Soporte para destrucción de infraestructura mediante workflow manual.
- Configuración de backend de Azure para almacenamiento de estado de Terraform.
- Documentación automatizada de componentes Terraform con terraform-docs.

### Cambiado
- **BREAKING CHANGE**: Migración completa de AWS a Azure como proveedor de nube.
- Reemplazo de recursos EC2, VPC y S3 por equivalentes de Azure (Virtual Machines, Virtual Networks y Storage Accounts).
- Actualización de la estructura del proyecto para usar módulos externos de Azure.
- Configuración del proveedor de Terraform para usar Azure Resource Manager.
- Modificación del archivo principal `main.tf` para utilizar módulos de infraestructura de Azure.

### Eliminado
- Configuración completa de AWS (provider, VPC, EC2, security groups).
- Archivos `provider.tf`, `vpc.tf`, `ec2.tf`, `data.tf` específicos de AWS.
- Script de instalación `install.sh` para herramientas de AWS.

### Corregido
- Optimización del pipeline de CI/CD con múltiples correcciones menores.
- Mejora en la salida del comando `terraform plan` para mejor legibilidad.
- Configuración correcta de variables de entorno para Azure CLI.
- Resolución de problemas con la configuración de Checkov en el pipeline.

### Agregado
- Definición inicial de variables en `variables.tf`.
- Documentación generada automáticamente con `terraform-docs`.
- Configuración básica de `provider` para AWS.

## [1.0.1] - 2024-11-28
### Corregido
- Solucionado un error en el nombre de salida `instance_id` en `output.tf`.
- Actualizadas las reglas de seguridad en `main.tf` para permitir solo tráfico SSH (puerto 22).

### Agregado
- Inclusión de la variable `instance_type` en `variables.tf` con valor por defecto `t2.micro`.
- Nueva salida `public_ip` para mostrar la dirección IP pública de la instancia EC2.

### Cambiado
- Actualización del nombre del bucket S3 a un nombre único generado dinámicamente.
- Modificación de `main.tf` para usar `aws_instance` con una AMI diferente.

## [1.0.0] - 2024-11-20
### Agregado
- Configuración inicial del proyecto con soporte para AWS.
- Creación de la instancia EC2 básica con `t2.micro`.
- Configuración del almacenamiento local y volumen EBS.
- Implementación de variables y outputs básicos para identificar recursos creados.

---

**Nota:** Este archivo se mantendrá actualizado con cada cambio significativo para mejorar la trazabilidad y la colaboración.