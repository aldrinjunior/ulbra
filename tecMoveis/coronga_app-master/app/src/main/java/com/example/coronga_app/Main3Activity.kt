package com.example.coronga_app

import android.os.AsyncTask
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main3.*
import kotlinx.android.synthetic.main.note_item.*
import kotlinx.android.synthetic.main.note_item.numero_mortos
import kotlinx.android.synthetic.main.note_item.numero_recusados
import kotlinx.android.synthetic.main.note_item.numero_suspeitos

class Main3Activity : AppCompatActivity() {

    val service = CardService()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main3)
        CardTask().execute()
    }

    inner class CardTask: AsyncTask<Void, Void, Card?>() {
        override fun doInBackground(vararg params: Void?): Card? {
            val uf = intent.getStringExtra("uf")
            return service.getCardDetail(uf)
        }

        override fun onPostExecute(result: Card?) {
            super.onPostExecute(result)
            if (result != null) {
                textView5.text = result.titulo
                numero_mortos.text = result.mortos.toString()
                numero_suspeitos.text = result.suspeitos.toString()
                numero_recusados.text = result.recusados.toString()
            }
        }
    }
}
