package com.example.practica01_adinaapopa

import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Bundle
import android.os.Environment
import android.widget.ImageView
import androidx.activity.enableEdgeToEdge
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.FileProvider
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.practica01_adinaapopa.databinding.ActivitySuperheroesBinding
import com.example.practica01_adinaapopa.model.SuperHeroe
import java.io.File

class SuperHeroesActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySuperheroesBinding

    // 1 - Variable que va a manejar el resultado de haber hecho la foto
    private lateinit var heroImage: ImageView
    private var heroBitmap: Bitmap? = null
    private var picturePath = ""

    // TakePicture devuelve un booleano: si la foto es exitosa o no
    private val getContent = registerForActivityResult(ActivityResultContracts.TakePicture()) { success ->
        if (success && picturePath.isNotEmpty()) {
            // Cualquier imagen del directorio la podemos convertir a bitmap
            heroBitmap = BitmapFactory.decodeFile(picturePath)
            // Mostramos la imagen en el cuadradito
            heroImage.setImageBitmap(heroBitmap)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        binding = ActivitySuperheroesBinding.inflate(layoutInflater)
        setContentView(binding.root)
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // 2 - Al pulsar la imagen se abre la cámara
        heroImage = binding.heroImage
        binding.heroImage.setOnClickListener {
            abrirCamara()
        }

        // Botón para volver al Home
        binding.btnVolver.setOnClickListener { finish() }

        binding.btnGuardar.setOnClickListener {
            val superHeroName = binding.heroNameEdit.text.toString()
            val alterEgo = binding.alterEgoEdit.text.toString()
            val bio = binding.bioEdit.text.toString()
            val power = binding.power.rating
            val superHeroe = SuperHeroe(superHeroName, alterEgo, bio, power)

            irADetailActivity(superHeroe)
        }
    }

    private fun abrirCamara() {
        // Path temporal donde se guardará la foto
        val imageFile = crearImagenFile()
        // FileProvider comparte el File con la app de cámara de forma segura
        val uri = FileProvider.getUriForFile(this, "${applicationContext.packageName}.provider", imageFile)
        getContent.launch(uri)
    }

    // Crea un File temporal y guarda su ruta
    private fun crearImagenFile(): File {
        val fileName = "superhero_image"
        val fileDirectory = getExternalFilesDir(Environment.DIRECTORY_PICTURES)
        val imageFile = File.createTempFile(fileName, ".jpg", fileDirectory)
        picturePath = imageFile.absolutePath
        return imageFile
    }

    private fun irADetailActivity(superHeroe: SuperHeroe) {
        val intent = Intent(this, DetailActivity::class.java)
        intent.putExtra("superHero", superHeroe)
        intent.putExtra("path_heroe", picturePath)
        startActivity(intent)
    }
}
