# Publicaciones — AMESMúsicas

Micrositio estático (HTML puro, sin frameworks ni CDN) para alojar los libros
de la **Academia Mexicana de Estudios Sociales de la Música (AMESMúsicas)**.
Todos los enlaces son relativos; se puede servir desde GitHub Pages o cualquier
host de archivos estáticos.

## Estructura

```
amesmusicas/
├── index.html                       portada del micrositio ("AMESMúsicas")
├── assets/estilo.css                estilos (paleta/tipografías del sitio)
└── libros/
    ├── index.html                   índice/catálogo de libros
    └── <slug-del-libro>/
        ├── index.html               página del libro (ficha + reseña + botones)
        ├── <slug-del-libro>.pdf     PDF descargable
        └── portada.png              portada
_PLANTILLA-libro/index.html          plantilla comentada para el siguiente libro
```

## Cómo publicar un libro nuevo

1. **Crea la carpeta** con el *slug* del libro (minúsculas, sin acentos,
   separado por guiones), por ejemplo `con-cantos-y-vihuelas`:
   ```
   amesmusicas/libros/<slug-del-libro>/
   ```

2. **Copia los recursos** dentro de esa carpeta:
   - `portada.png` — imagen de portada.
   - `<slug-del-libro>.pdf` — PDF de descarga (el nombre del archivo debe
     coincidir con el `{{SLUG}}.pdf` de los botones).

3. **Crea la página del libro** copiando la plantilla:
   ```
   copia  _PLANTILLA-libro/index.html  →  amesmusicas/libros/<slug>/index.html
   ```
   y reemplaza todos los `{{PLACEHOLDERS}}`:
   `{{TITULO}}`, `{{TITULO_CORTO}}`, `{{CATEGORIA}}`, `{{ANIO}}`,
   `{{AUTORES}}`, `{{ISBN}}`, `{{PAGINAS}}`, `{{RESENA}}`,
   `{{RESENA_CORTA}}`, `{{SLUG}}`.

   > Las rutas `../../assets/estilo.css` de la plantilla ya son correctas
   > cuando el archivo vive en `amesmusicas/libros/<slug>/index.html`.

4. **Añade la ficha al catálogo** `amesmusicas/libros/index.html`:
   copia un bloque `<article class="book-item"> … </article>` y actualiza
   portada, enlace, categoría, título y reseña.

5. **Opcional:** añade una tarjeta al bloque de destacados en
   `amesmusicas/index.html`.

6. **Verifica** que los dos botones de la página del libro
   ("Descargar PDF" y "Leer en línea") apunten al PDF local de la carpeta,
   y que `portada.png` cargue (con texto `alt` descriptivo).

## Convenciones

- HTML estático puro, **sin** frameworks ni CDN.
- Enlaces **solo relativos**.
- Texto visible del micrositio: **AMESMúsicas**.
- Toda página incluye `<title>`, `meta description` y Open Graph.
- Imágenes siempre con `alt` descriptivo.
