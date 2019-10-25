# Prueba Tecnica Loro

El proyecto se realizó en Xcode 11.1 para un dispositivo iOS con versión 13.1. El proyecto está dividido en carpetas, cada carpeta corresponde a una vista donde están los archivos que la conforman.

En la carpeta Model hay dos estructuras, la primera es la estructura 

User que se encarga de authenticar al usuario a firebase. 

```swift
struct User {
    private(set) var email: String?
    private(set) var photoUrl: URL?
    
    mutating func getUserData () {
        let user = Auth.auth().currentUser
        if let user = user {
            self.email = user.email
            self.photoUrl = user.photoURL
        }
    }
}
```

La segunda estructura es Post que está hecha con la misma forma que se encuentra la estructura de la base de datos en firebase, se tiene cada propiedad del mismo tipo que se encuentra en la base de datos. Esta estructura tiene dos init uno crear el objeto y subirlo a firebase y el otro init opcional que se encarga de crear el objeto con los datos que vienen de firebase. Con la aplicación no se pueden agregar comentarios pero la variable se tenía en mente para poder agregarlos.


```swift
struct Post {
    let ref: DatabaseReference?
    let foto: String
    let post: String
    let usuario: String
    var comentarios: [NSDictionary] = [["comentarios":"default","usuario":"default"]]
    
    init (foto: String, post: String, usuario: String) {
        self.ref = nil
        self.foto = foto
        self.post = post
        self.usuario = usuario
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String:AnyObject],
            let foto = value["foto"] as? String,
            let post = value["post"] as? String,
            let usuario = value["usuario"] as? String,
            let comentarios = value["comentarios"] as? NSArray
            else { return nil }
        self.ref = snapshot.ref
        self.foto = foto
        self.post = post
        self.usuario = usuario
        self.comentarios = comentarios as! [NSDictionary]
    }
    
    func toAnyObject() -> Any {
        return [
            "foto": foto,
            "post": post,
            "usuario": usuario,
            "comentarios": comentarios
        ]
    }
}
```

Lo primero que se muestra es la vista de Login (ViewController), esta vista hace un check de los campos para saber si los campos están completados.

<img src="https://raw.githubusercontent.com/camyoh/PruebaTecnicaLoro/master/images/login.png" width="40%" height="40%">

La primer vista que se muestra después del login es un UITabBarController que por defecto carga a ContentViewController, en esta vista se encuentra el listado de los posts que se trajeron de la base de datos. En la parte de arriba encontramos la umagen del usuario y una opción para agregar un post. Le sigue un tableview que muestra la imagen de cada usuario el correo,  el post que escribió y un botón de comnetar que redirige a los comentarios pero todavía no están implementados todavía.

<img src="https://raw.githubusercontent.com/camyoh/PruebaTecnicaLoro/master/images/content1.png" width="40%" height="40%">

la segunda pestaña es UserViewController que tiene la imagen del usuario, el correo y un botón para cerrar sesión.

<img src="https://raw.githubusercontent.com/camyoh/PruebaTecnicaLoro/master/images/profile.png" width="40%" height="40%">

Cuando el usuario selecciona escribir un post se abre la vista que tiene el PostViewController

<img src="https://raw.githubusercontent.com/camyoh/PruebaTecnicaLoro/master/images/publicar.png" width="40%" height="40%">
<img src="https://raw.githubusercontent.com/camyoh/PruebaTecnicaLoro/master/images/publicar2.png" width="40%" height="40%">

# ¿Qué características considera que tiene un buen código?

Considero que un buen código debe ser legible, es decir que cualquier desarrollador sea capaz de leerlo sin que lo haya desarrollado. Esto tiene como consecuencia que se sigan principios de clean code, por ejemplo principios de Single Responsability para los métodos y las clases. Que los métodos tengan nombres expresivos y que ese nombre sea efectivamente lo que realiza el método.
