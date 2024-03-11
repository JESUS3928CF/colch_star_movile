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
        "id_detalle_orden": 5,
        "cantidad": 2,
        "subtotal": "60000.00",
        "descripcion":
            "Esta camisa es una camisa azul en v de la empresa Colch Star.",
        "fk_producto": 5,
        "talla": "M",
        "color": "Azul",
        "fk_orden": 5,
        "producto": {
          "nombre": "Camisa En V Azul",
          "imagen": "P7ZQGzwkc.png",
          "precio": "30000.00"
        }
      },
      {
        "id_detalle_orden": 6,
        "cantidad": 6,
        "subtotal": "60000.00",
        "descripcion":
            "Esta camisa es una camisa azul en v de la empresa Colch Star.",
        "fk_producto": 5,
        "talla": "L",
        "color": "Azul",
        "fk_orden": 5,
        "producto": {
          "nombre": "Camisa En V Azul",
          "imagen": "P7ZQGzwkc.png",
          "precio": "30000.00"
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
        "id_detalle_orden": 7,
        "cantidad": 2,
        "subtotal": "60000.00",
        "descripcion":
            "Esta camisa es una camisa azul en v de la empresa Colch Star.",
        "fk_producto": 5,
        "talla": "M",
        "color": "Azul",
        "fk_orden": 5,
        "producto": {
          "nombre": "Camisa En V Azul",
          "imagen": "P7ZQGzwkc.png",
          "precio": "30000.00"
        }
      }
    ]
  },
  
];
