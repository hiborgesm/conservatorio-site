# Publicaciones — AMESMúsicas

Micrositio estático (HTML puro, sin frameworks ni CDN) para alojar los libros
de la **Academia Mexicana de Estudios Sociales de la Música (AMESMúsicas)**.
Todos los enlaces son relativos; se puede servir desde GitHub Pages o cualquier
host de archivos estáticos.

## Estructura

```
amesmusicas/
├── index.html                                portada del micrositio ("AMESMúsicas")
├── assets/estilo.css                         estilos (paleta/tipografías del sitio)
└── libros/
    ├── index.html                            índice/catálogo de libros
    ├── con-cantos-y-vihuelas/
    │   ├── index.html                        página del libro (ficha + reseña + botones)
    │   ├── con-cantos-y-vihuelas.pdf         PDF descargable
    │   └── portada.png                       portada
    ├── ah-que-la-cancion-ranchera/
    │   ├── index.html                        página del libro (ficha + reseña)
    │   └── portada.jpg                       portada
    ├── la-mujer-en-la-musica-tradicional/
    │   ├── index.html                        página del libro (ficha + reseña)
    │   └── portada.jpg                       portada
    └── cuadernos-albarran-palacios/
        ├── index.html                        página del libro (ficha + reseña)
        └── portada.jpg                       portada
_PLANTILLA-libro/index.html                   plantilla comentada para el siguiente libro
```

## Libros publicados

| Slug | Título | ISBN | Año | Páginas |
|------|--------|------|-----|---------|
| `con-cantos-y-vihuelas` | Con cantos y vihuelas… el objeto sonoro en las culturas musicales de México | 978-607-69464-0-4 | 2026 | 239 |
| `ah-que-la-cancion-ranchera` | Del rancho a la canción… ¡Ah que la canción ranchera! Estudios sobre el espacio y la cultura musical ranchera | 978-607-69464-3-5 | 2026 | 174 |
| `la-mujer-en-la-musica-tradicional` | La mujer en la música tradicional | 978-607-69464-5-9 | 2026 | 183 |
| `cuadernos-albarran-palacios` | Cuadernos de Música de Don Alberto Albarrán Palacios | 978-607-69464-4-2 | 2026 | 110 |

> Las URLs son estables: se usan como destino de **códigos QR** impresos.
> Si se cambia un slug, los QR ya impresos dejan de funcionar.

## Cómo publicar un libro nuevo

1. **Crea la carpeta** con el *slug* del libro (minúsculas, sin acentos,
   separado por guiones), por ejemplo `con-cantos-y-vihuelas`:
   ```
   amesmusicas/libros/<slug-del-libro>/
   ```

2. **Copia los recursos** dentro de esa carpeta:
   - `portada.png` (o `portada.jpg`) — imagen de portada.
   - `<slug-del-libro>.pdf` — PDF de descarga, si existe (el nombre del archivo
     debe coincidir con el `{{SLUG}}.pdf` de los botones).

3. **Crea la página del libro** copiando la plantilla:
   ```
   copia  _PLANTILLA-libro/index.html  →  amesmusicas/libros/<slug>/index.html
   ```
   y reemplaza todos los `{{PLACEHOLDERS}}`:
   `{{TITULO}}`, `{{TITULO_CORTO}}`, `{{CATEGORIA}}`, `{{ANIO}}`,
   `{{AUTORES}}`, `{{ISBN}}`, `{{PAGINAS}}`, `{{RESENA}}`,
   `{{RESENA_CORTA}}`, `{{SLUG}}`.

   > Las rutas `../../assets/estilo.css` ya son correctas cuando el archivo
   > vive en `amesmusicas/libros/<slug>/index.html`.

4. **Reseña en pop-up (convención del micrositio):** la reseña larga va dentro
   de `<dialog id="modal-resena">` y se abre con el botón «Leer la reseña»
   (`#abrir-resena`). En la página solo se muestra una línea de entrada.

5. **Añade la ficha al catálogo** `amesmusicas/libros/index.html`: el catálogo
   es una **estantería horizontal** (scroll-snap). Copia un bloque
   `<li class="libro"> … </li>` y actualiza portada, enlace, categoría y título.
   Con 4+ libros aparecen solas las flechas y los puntos (JS propio, sin
   librerías).

6. **Opcional:** añade una tarjeta al bloque de destacados en
   `amesmusicas/index.html`.

7. **Verifica** que los enlaces relativos resuelvan (portada, CSS, PDF si lo hay)
   y que `portada.png`/`portada.jpg` carguen (con texto `alt` descriptivo).

## Convenciones

- HTML estático puro, **sin** frameworks ni CDN.
- Enlaces **solo relativos**.
- Texto visible del micrositio: **AMESMúsicas**.
- Toda página incluye `<title>`, `meta description` y Open Graph.
- Imágenes siempre con `alt` descriptivo.
- Si un dato bibliográfico no está confirmado, **no se inventa**: se omite o se
  marca explícitamente como pendiente.
