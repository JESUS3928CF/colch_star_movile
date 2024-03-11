List<Map<String, dynamic>> ordenes = [
  {
    "id_orden": 1,
    "precio_total": 20000,
    "fecha_entrega": "2024-02-20",
    "fecha_creacion": "2024-01-23",
    "estado_de_orden": "En proceso",
    "cliente": {
      "nombre": "Brian",
      "apellido": "Pareja",
      "identificacion": "1013338235",
      "direccion": "Calle 50 # 20"
    },
    "detalles": [
      {
        "cantidad": 2,
        "descripcion":
            "Esta camisa es una camisa azul en v de la empresa Colch Star.",
        "talla": "M",
        "color": "Azul",
        "producto": {
          "nombre": "Camisa En V Azul",
        }
      },
      {
        "cantidad": 6,
        "descripcion":
            "Esta camisa es una camisa azul en v de la empresa Colch Star.",
        "fk_producto": 5,
        "talla": "L",
        "color": "Azul",
        "producto": {
          "nombre": "Camisa En V Azul",
        }
      }
    ]
  },
  {
    "id_orden": 2,
    "precio_total": 20000,
    "fecha_entrega": "2024-02-20",
    "fecha_creacion": "2024-01-20",
    "estado_de_orden": "Creada",
    "cliente": {
      "nombre": "Brian",
      "apellido": "Pareja",
      "identificacion": "1013338235",
      "direccion": "Calle 50 # 20"
    },
    "detalles": [
      {
        "cantidad": 2,
        "descripcion":
            "Esta camisa es una camisa azul en v de la empresa Colch Star.",
        "talla": "M",
        "color": "Azul",
        "producto": {
          "nombre": "Camisa En V Azul",
        }
      }
    ]
  },
  
];
