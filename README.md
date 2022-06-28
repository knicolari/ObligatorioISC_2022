# Este repositorio contiene el codigo automatizado para el despliegue de la infraestructura mediante Terraform.

## Diagrama de la infraestructura:

   ![Diagrama AWS 2 drawio](https://user-images.githubusercontent.com/88011707/175790319-1d397be0-67c0-407e-891d-4cbacaf3f279.png)




## Datos de la infraestructura:

- Las instancias que utilizaremos seran de EC2 con sistema Linux de tipo t3.large y capacidad de 20GB de disco .
- Un vpc el cual contendra dos subnets cada una en una zona de disponibilidad distinta, estas instancias estaran cada una alojada en una de estas subnets.

    
    # Region y zonas de disponibilidad:
      Region us-east-1
      Zona de disponibilidad: us-east-1a y us-east-1b
    # CIDRs Block para VPC:
      172.16.0.0./16
    # CIDRs Block para subnet:
      1) 172.16.1.0/24
      2) 172.16.2.0/24
      
- Se creara un security group para controlar el trafico de ingreso por HTTP y HTTPS a la red asi como la salida de la misma.

    # Configuracion de ingreso para HTTP:
        Protocolo: TCP
        Puerto: 80
        CIDR block: 0.0.0.0/0
        
    # Configuracion de ingreso para HTTPS:
        Protocolo: TCP
        Puerto: 443
        CIDR block: 0.0.0.0/0
        
    # Configuracion de egreso:
        Protocolo: TCP
        Puerto: -1
        CIDR block 0.0.0.0/0
        
- Utilizamos un internet gateway para comunicar las instancias o algun otro componente de la vpc con internet.
- Aplicaremos route table para poder determinar donde vamos a poder dirigir el trafico.
- Como vamos a utilizar kubernetes para el manejo de los microservicios decidimos utilizar el servicio de AWS Elastic Kubernetes Service (EKS), a traves de éste         crearemos el cluster junto con el grupo de nodos correspondientes.
- Como configuracion de escalamiento de EKS el numero de nodos que establecimos es dos, ya que como el tamaño de la infraestructura de microservicios no es tan           demandante, con este numero de nodos alcanzara para cubrir los requerimientos necesarios.
- EKS creara un Auto Scaling Group de manera que si accidentalemnte se daña o se elimina una instancia esta se recreará manteniendo el numero de instancias               establecido.

## Servicios de AWS utilizados:
    - EC2
    - EKS
    - VPC
    - Auto Scaling Groups
    
## Para ver como se utiliza el codigo de Terraform haz click [aqui](https://github.com/knicolari/ObligatorioISC_2022/blob/7020a79c857283c9b1efd6755bc86d688b863fac/Codigo%20Terraform/README.md)


## Ensamblaje de imagenes:
   - Usamos Docker Engine 20.10.15 para el ensamblaje de las imagenes usando los Dockerfile que se encuentran en [este](https://github.com/ISC-ORT-FI/online-boutique)
   repositorio, entrando en el direcotorio src/"nombre del servicio"/Dockerfile
   - Previo a esto se creo una cuenta en Dockerhub, el cual es un repositorio donde estaran subidas las imagenes a utilizar luego.
   - Se loguea con el comando sudo docker login, el cual nos pedira el usuario de Dockerhub y la contraseña.
   - Luego el proceso de ensamblaje y subir la imagen al repositorio se puede acceder en el siguiente [link](https://docs.docker.com/docker-hub/repos/#:~:text=To%20push%20an%20image%20to,docs%2Fbase%3Atesting%20).)
    
   
## Para acceder al archivo que contiene informacion de despliegue entre [aqui](https://github.com/knicolari/ObligatorioISC_2022/blob/8bf51017f8cdbd07c5f0ed7895c65d5efbc2cc2e/Deployment/README.md)









