package com.example.practica01_adinaapopa

import android.content.Intent
import android.os.Bundle
import android.widget.LinearLayout
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class HomeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }


        // 1. Recogemos el texto enviado desde el Login
        val usuarioRecibido = intent.getStringExtra("USER_EXTRA")

        val tvSaludo = findViewById<TextView>(R.id.textView)

        // 2. Si nos ha llegado un nombre de usuario, cambiamos el texto por defecto
        if (!usuarioRecibido.isNullOrEmpty()) {
            tvSaludo.text = "Hola $usuarioRecibido"
        }

        // 3. Al pulsar cada icono se abre la app correspondiente
        findViewById<LinearLayout>(R.id.btnEdadCanina).setOnClickListener {
            startActivity(Intent(this, EdadCaninaActivity::class.java))
        }
        findViewById<LinearLayout>(R.id.btnSuperHeroes).setOnClickListener {
            startActivity(Intent(this, SuperHeroesActivity::class.java))
        }
        findViewById<LinearLayout>(R.id.btnQuizzes).setOnClickListener {
            startActivity(Intent(this, QuizActivity::class.java))
        }
    }
}