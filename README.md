# Este repositorio contiene el codigo automatizado para el despliegue de la infraestructura de microservicios mediante Terraform.

## Diagrama de la infraestructura:

   ![Diagrama AWS 2 drawio](https://user-images.githubusercontent.com/88011707/175790319-1d397be0-67c0-407e-891d-4cbacaf3f279.png)




## Datos de la infraestructura:

- Las instancias que utilizaremos seran de EC2 con sistema Linux de tamaño t3.large y capacidad de 20GB de disco .
- Un vpc al cual contendra dos subnets cada una en una zona de disponibilidad distinta, estas instancias estaran cada una alojada en una de estas subnets.
    # CIDRs Block para VPC:
      172.16.0.0./16
    # CIDRs Block para subnet:
      1) 172.16.1.0/24
      2) 172.16.2.0/24
- Se creara un security group para permitir conexion por ssh, de manera que se pueda acceder de manera remota.
    # Configuracion de ingreso:
        Protocolo TCP
        Puerto 22
        CIDR block 0.0.0.0/0
        
- Utilizamos un internet gateway para comunicar las instancias o algun otro componente de la vpc con internet.
- Aplicaremos route table para poder determinar donde vamos a poder dirigir el trafico.
- Como vamos a utilizar kubernetes para el manejo de los microservicios decidimos utilizar el servicio de AWS Elastic Kubernetes Service (EKS), a traves de éste crearemos el cluster junto con el grupo de nodos correspondientes.
- Como configuracion de escalamiento de EKS el numero de nodos que establecimos es dos, ya que como el tamaño de la infraestructura de microservicios no es tan demandante, con este numero de nodos alcanzara para cubrir los requerimientos necesarios.
- EKS creara un Auto Scaling Group de manera que si accidentalemnte se daña o se elimina una instancia esta se recreará manteniendo el numero de instancias requerido

## Servicios de AWS utilizados:
    - EC2
    - EKS
    - VPC
    - Auto Scaling Groups









