package com.example.practica01_adinaapopa

import android.graphics.BitmapFactory
import android.os.Build
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.practica01_adinaapopa.databinding.ActivityDetailBinding
import com.example.practica01_adinaapopa.model.SuperHeroe

class DetailActivity : AppCompatActivity() {
    private lateinit var binding: ActivityDetailBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        binding = ActivityDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // Botón para volver a la pantalla anterior
        binding.btnVolver.setOnClickListener { finish() }

        // 1 - Recibimos el objeto SuperHeroe del Intent
        val superHeroe = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent.getParcelableExtra("superHero", SuperHeroe::class.java)
        } else {
            @Suppress("DEPRECATION")
            intent.getParcelableExtra<SuperHeroe>("superHero")
        }

        // 2 - Recuperamos la foto a partir de su ruta
        val bitmapDirectory = intent.getStringExtra("path_heroe")
        val bitmap = if (!bitmapDirectory.isNullOrEmpty()) BitmapFactory.decodeFile(bitmapDirectory) else null

        // 3 - Rellenamos los campos con los valores recibidos
        binding.heroNameTv.text = superHeroe?.nombre ?: "No hay nombre"
        binding.alterEgoResult.text = superHeroe?.alterEgo ?: "No hay AlterEgo"
        binding.bioResult.text = superHeroe?.bio ?: "No hay bio"
        binding.ratingResult.rating = superHeroe?.power ?: 0f

        if (bitmap != null) {
            binding.imagenHeroeDetail.setImageBitmap(bitmap)
        }
    }
}
