package com.example.practica01_adinaapopa

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.practica01_adinaapopa.databinding.ActivityQuizBinding
import com.example.practica01_adinaapopa.model.BancoPreguntas

class QuizActivity : AppCompatActivity() {

    private lateinit var binding: ActivityQuizBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        binding = ActivityQuizBinding.inflate(layoutInflater)
        setContentView(binding.root)
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // 1 - Datos recibidos: qué pregunta toca y cuántos puntos llevamos
        val indice = intent.getIntExtra(EXTRA_INDICE, 0)
        val puntos = intent.getIntExtra(EXTRA_PUNTOS, 0)
        val preguntas = BancoPreguntas.preguntas
        val pregunta = preguntas[indice]

        // 2 - Pintamos número de pregunta, barra de progreso, enunciado y opciones
        binding.tvProgreso.text = getString(R.string.quiz_progreso, indice + 1, preguntas.size)
        binding.progressBar.max = preguntas.size
        binding.progressBar.progress = indice + 1
        binding.tvPregunta.setText(pregunta.texto)

        val opciones = listOf(binding.opcion1, binding.opcion2, binding.opcion3)
        opciones.forEachIndexed { i, radio -> radio.setText(pregunta.opciones[i]) }

        // 3 - Al enviar: si no hay nada marcado, Toast y no se avanza
        binding.btnSend.setOnClickListener {
            val marcado = binding.radioGroup.checkedRadioButtonId
            if (marcado == -1) {
                Toast.makeText(this, R.string.quiz_toast_sin_respuesta, Toast.LENGTH_SHORT).show()
            } else {
                val seleccion = opciones.indexOfFirst { it.id == marcado }
                val acierto = seleccion == pregunta.correcta

                val intent = Intent(this, ResultActivity::class.java)
                intent.putExtra(EXTRA_INDICE, indice)
                intent.putExtra(EXTRA_PUNTOS, if (acierto) puntos + 1 else puntos)
                intent.putExtra(EXTRA_ACIERTO, acierto)
                startActivity(intent)
                finish()
            }
        }

        // Botón para volver al Home
        binding.btnVolver.setOnClickListener { finish() }
    }

    companion object {
        const val EXTRA_INDICE = "indice"
        const val EXTRA_PUNTOS = "puntos"
        const val EXTRA_ACIERTO = "acierto"
    }
}
