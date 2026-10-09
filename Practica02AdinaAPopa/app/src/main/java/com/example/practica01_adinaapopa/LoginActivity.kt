package com.example.practica01_adinaapopa

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(android.R.id.content)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val btnLogin = findViewById<Button>(R.id.btnLogin)
        val etUsername = findViewById<EditText>(R.id.etUsername)

        // 2. Programamos el evento al hacer clic en el botón de Login
        btnLogin.setOnClickListener {
            val usuario = etUsername.text.toString().trim()

            // 3. Validamos que no esté vacío antes de cambiar de pantalla
            if (usuario.isNotEmpty()) {
                // Creamos el Intent para saltar a la HomeActivity y enviamos el dato
                val intent = Intent(this, HomeActivity::class.java).apply {
                    putExtra("USER_EXTRA", usuario)
                }
                startActivity(intent)
            } else {
                // Si está vacío, mostramos un error
                etUsername.error = "Por favor, introduce tu usuario"
            }
        }
    }
}