# 🌱 App-Movile-Plant-imaginatio

Repositorio del proyecto transmedia **Imaginatio** — un juego donde los usuarios coleccionan y cuidan plantas virtuales que evolucionan hasta convertirse en **Ents** y participan en combates multijugador.

El repositorio contiene tanto el **Backend (FastAPI)** como el **Frontend móvil (Flutter)** para el sistema de plantas virtuales e integración de minijuegos.

---

## 📁 Estructura del Repositorio

```
App-Movile-Plant-imaginatio/
├── backend/        # API FastAPI — motor lógico del juego
└── flutter/        # App móvil Flutter — widget Android + Smartwatch
```

---

## ⚙️ Backend (FastAPI)

API REST construida con **FastAPI** para el control y progresión de plantas virtuales. Actúa como motor lógico stateless — recibe el estado actual de la planta, aplica las reglas del juego y devuelve el nuevo estado. Incluye persistencia de usuarios e inventarios en archivos JSON locales, mecánicas de minijuegos con validación anti-trampa y restricciones de cooldown en tiempo real.

### 🚀 Cómo ejecutar el Backend

**1. Navegar a la carpeta del backend:**
```bash
cd backend
```

**2. Instalar dependencias con uv:**
```bash
uv sync
```
**3. Levantar el servidor:**
```bash
# opc 1
uv run uvicorn main:app --reload
# opc 2
uv run fastapi dev main.py 

```

**5. Abrir la documentación interactiva de Swagger:**
`http://localhost:8000/docs`

---

### 🛠️ Módulos y Endpoints del Backend

#### 👤 1. Registro de Usuario

- `POST /user/register` — Crea un nuevo jugador con `{"username": "TuNombre"}`. Devuelve el `user_id` único y crea automáticamente una planta **Pasto** de prueba.

---

#### 🌱 2. Inventario y Plantas

- `GET /user/{user_id}/inventory` — Obtiene todas las plantas con su stage. Unity usa este endpoint para mostrar el avatar del jugador y verificar Ents disponibles.
- `POST /user/{user_id}/plants/sync` — Flutter sincroniza el inventario al servidor cuando el usuario abre Unity.
- `POST /user/{user_id}/plants/unlock` — Desbloquea un nuevo tipo de planta ganado en combate.

---

#### 💰 3. Recursos del Usuario

- `GET /user/{user_id}/resources` — Consulta el inventario de recursos: sol, agua, fertilizante y composta.
- `POST /user/{user_id}/resources/use` — Descuenta recursos del inventario.

---

#### 🎮 4. Minijuegos y Ganancia de Recursos

- `POST /minigame/sun` — Clicker de sol. Cada click = 1 sol. Validación anti-trampa: máx. 12 clicks/segundo.
- `POST /minigame/water` — Clicker de agua (5 segundos). Recompensa por clicks:
  - 0–24 → 0 agua · 25–34 → 2 agua · 35–49 → 4 agua · 50 → 6 agua
- `POST /minigame/compost` — Matriz (4 compostadas + 4 basuras, 2 segundos). Conversión automática: cada 4 compostadas = 1 fertilizante.
- **Cooldowns ⏱️:** 10 minutos de espera entre juegos.

---

#### 💖 5. Cuidado de la Planta

- `POST /plant/water` — Riega la planta (gasta 1 agua).
- `POST /plant/sun` — Aplica sol (gasta 1 sol).
- `POST /plant/fertilize` — Aplica fertilizante (gasta 1 fertilizante).
- `POST /plant/evolve` — Verifica si la planta puede evolucionar.
- **Validación:** inventario en 0 → `400 Bad Request`.
- **Muerte por inactividad:** más de 72 horas sin interacción → planta muere.

---

#### 🌿 6. Etapas de Evolución

```
Semilla → Arbusto → Árbol → Ent
                              └── puede participar en combates Unity
```

Recursos necesarios por tipo de planta:

| Tipo | Semilla (Sol/Agua) | Arbusto (Sol/Agua) | Árbol (Sol/Agua) |
|---|---|---|---|
| Solar | 6 / 2 | 8 / 4 | 10 / 6 |
| Xerofito | 4 / 2 | 6 / 4 | 8 / 6 |
| Templado | 4 / 4 | 6 / 6 | 8 / 8 |
| Montaña | 2 / 4 | 4 / 6 | 6 / 8 |
| Hidro | 2 / 6 | 4 / 8 | 6 / 10 |

Fertilizante necesario (igual para todos los tipos):
- Semilla → Arbusto: **4** · Arbusto → Árbol: **6** · Árbol → Ent: **8**

---

## 📱 Frontend Móvil (Flutter)

Widget Android y Smartwatch para el cuidado diario de las plantas. Toda la persistencia local se maneja con **Hive**.

## 📚 Recursos

- [FastAPI Docs](https://fastapi.tiangolo.com)
- [Flutter Docs](https://flutter.dev/docs)
- [Learn Git Branching](https://learngitbranching.js.org)
