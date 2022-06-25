# Este repositorio contiene el codigo automatizado para el despliegue de la infraestructura de microservicios mediante Terraform.

## Diagrama de la infraestructura:

   ![Diagrama AWS 2 drawio](https://user-images.githubusercontent.com/88011707/175790319-1d397be0-67c0-407e-891d-4cbacaf3f279.png)




## Datos de la infraestructura:

-Instancias de EC2 con sistema Linux, capacidad de 20GB de disco y de tamaño t3.large.
- Un vpc al cual se le uniran dos subnets cada una en una zona de disponibilidad distinta.
    # CIDRs Block para VPC:
      172.16.0.0./16
    # CIDRs Block para subnet:
      1) 172.16.1.0/24
      2) 172.16.2.0/24
- Un security group para permitir conexion por ssh.
    # Configuracion de ingreso:
        Protocolo TCP
        Puerto 22
        CIDR block 0.0.0.0/0
        
- Utilizamos un internet gateway para comunicar las instancias o algun otro componente de la vpc con internet.
- Un route table para poder determinar donde vamos a poder dirigir el trafico.
- Un cluster de EKS junto con un grupo de nodos el cual contendra las aplicaciones
## Servicios de AWS utilizados:
    - EC2
    - EKS
    - VPC
    - Auto Scaling Groups









