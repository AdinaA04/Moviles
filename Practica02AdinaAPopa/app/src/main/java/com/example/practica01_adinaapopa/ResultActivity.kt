package com.example.practica01_adinaapopa

import android.content.Intent
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.practica01_adinaapopa.databinding.ActivityResultBinding
import com.example.practica01_adinaapopa.model.BancoPreguntas

class ResultActivity : AppCompatActivity() {

    private lateinit var binding: ActivityResultBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        binding = ActivityResultBinding.inflate(layoutInflater)
        setContentView(binding.root)
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val indice = intent.getIntExtra(QuizActivity.EXTRA_INDICE, 0)
        val puntos = intent.getIntExtra(QuizActivity.EXTRA_PUNTOS, 0)
        val acierto = intent.getBooleanExtra(QuizActivity.EXTRA_ACIERTO, false)
        val total = BancoPreguntas.preguntas.size
        val esUltima = indice == total - 1

        // 1 - Acierto o fallo
        if (acierto) {
            binding.imgResultado.setImageResource(R.drawable.ic_acierto)
            binding.tvResultado.setText(R.string.quiz_acierto)
            binding.tvDetalle.setText(R.string.quiz_acierto_detalle)
        } else {
            binding.imgResultado.setImageResource(R.drawable.ic_fallo)
            binding.tvResultado.setText(R.string.quiz_fallo)
            binding.tvDetalle.setText(R.string.quiz_fallo_detalle)
        }

        // 2 - Botón: siguiente pregunta, o "Start again" si era la última
        if (esUltima) {
            binding.tvFinal.text = getString(R.string.quiz_final, puntos, total)
            binding.tvFinal.visibility = android.view.View.VISIBLE
            binding.btnNext.setText(R.string.quiz_reiniciar)
            binding.btnNext.setOnClickListener {
                abrirPregunta(0, 0)
            }
        } else {
            binding.btnNext.setText(R.string.quiz_siguiente)
            binding.btnNext.setOnClickListener {
                abrirPregunta(indice + 1, puntos)
            }
        }

        binding.btnVolver.setOnClickListener { finish() }
    }

    private fun abrirPregunta(indice: Int, puntos: Int) {
        val intent = Intent(this, QuizActivity::class.java)
        intent.putExtra(QuizActivity.EXTRA_INDICE, indice)
        intent.putExtra(QuizActivity.EXTRA_PUNTOS, puntos)
        startActivity(intent)
        finish()
    }
}
