# Práctica SuperPoderes
Práctica realizada para el Módulo de Super Poderes. En esta práctica se han utilizado varias tecnologías como son Swift UI y Combine, dentro de una arquitectura MVVM.
Por un lado, ejecutamos la App y nos aparece una pantalla LaunchScreen:
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/c779ae38-abb5-4a26-a073-07b69d686ca0)

Tras el LaunchScreen, aparece una pantalla de carga:
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/d3e0fef2-a161-4d28-9f65-4a41b581e190)

Tras esta pantalla de carga, empezamos a ejecutar las tareas que nos pide el enunciado. Al comienzo, entramos en la pantalla Home, donde listamos los Héroes que traemos de la Api de marvel, developer.marvel.com. En este listado, mostramos la imagen y título de cada personaje. Como extra, hemos añadido una barra de búsqueda para filtrar por Héroe.
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/d01f8aa9-f38f-4213-84ec-ff4af098a8ba)

Al hacer Tap en cada Heróe, nos lleva a una pantalla del Detalle de cada Héroe:
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/880f36c1-e838-416f-a1f6-c87b3a7fa147)
En esta pantalla, como vemos, mostramos la imagen del Héroe, junto a su nombre y descripción. La descripción al ser opcional, le hemos añadido ".opacity(hero.description == "" ? 0:1)" para que si el Héroe seleccionado no tiene descripción, no muestre el background.
Además, debajo, hemos añadido un botón que nos lleva al listado de Series donde aparece el Héroe seleccionado, como vemos a continuación:
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/d4e6ef64-721d-41ca-9bfa-e09fe1edc773)
Aquí, hemos añadido la imagen, título y descripción de cada Serie. Además, al igual que en listado de Héroes, hemos añadido una barra de búsqueda para poder filtrar y buscar Series.

Por otro lado, se nos pide hacer un Testing a la aplicación, con una cobertura mínima del 50%.
Para ello, hemos realizado un test a los Modelos y ViewModels de Héroes y Series. Además, también hemos realizado test a las vistas de Detalle y RowView de Héroe y a la vista de RowView de Series:
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/b2771f6d-51be-49a6-9776-f9e711353f59)
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/4714d8f7-38eb-41f3-bfc0-b4afccb81c80)
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/9a16a670-a82d-498f-b43c-15ee2eabfee4)

Tras el Testing realizado, hemos conseguido un 60% de cobertura:
![image](https://github.com/sergio97re/SuperPoderes/assets/126094274/c5a66a7d-5f91-4228-bb27-a496a5debdd8)






