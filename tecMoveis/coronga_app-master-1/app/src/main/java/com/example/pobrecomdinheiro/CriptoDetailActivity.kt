package com.example.pobrecomdinheiro


import android.os.AsyncTask
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.annotation.RequiresApi
import kotlinx.android.synthetic.main.activity_main3.*
import kotlinx.android.synthetic.main.note_item.*
import kotlinx.android.synthetic.main.note_item.numero_mortos
import kotlinx.android.synthetic.main.note_item.numero_recusados
import kotlinx.android.synthetic.main.note_item.numero_suspeitos

class CriptoDetailActivity : AppCompatActivity() {

    val service = CardService()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_cripto_list_detail)
        CardTask().execute()
    }

    inner class CardTask: AsyncTask<Void, Void, Card?>() {
        @RequiresApi(Build.VERSION_CODES.O)
        override fun doInBackground(vararg params: Void?): List<Card> {
            val coin = intent.getStringExtra("coin")
            return service.getCardDetail(coin)
        }

        override fun onPostExecute(result: Card?) {
            super.onPostExecute(result)
            if (result != null) {
                coin_name.text = result.name
                buy_value.text = result.buy_value.toString()
            }
        }
    }
}
// Exemplo com coroutines
// import androidx.appcompat.app.AppCompatActivity
// import android.os.Bundle
// import kotlinx.android.synthetic.main.detailcrypto.*
// import kotlinx.coroutines.*
// import kotlinx.coroutines.Dispatchers.IO
// import kotlinx.coroutines.Dispatchers.Main
// import java.lang.Exception

// class DetailCryptoCur : AppCompatActivity() {
//     override fun onCreate(savedInstanceState: Bundle?) {
//         super.onCreate(savedInstanceState)
//         setContentView(R.layout.detailcrypto)
//         var db = AppDatabase.getDatabase(applicationContext).cryptoDAO()
//         val stringCryptoName = intent.getStringExtra("crypto")
//         val stringCryptoCode = intent.getStringExtra("cryptocode")
//         val stringCryptoPrice = intent.getStringExtra("price").toDouble()
//         var total : Double = 0.0
//         crypCod.text = stringCryptoCode
//         cryptoNome.text = stringCryptoName
//         txtPrice.text = "%.2f".format(stringCryptoPrice) + " USD"
//         val cryptoBuy = CryptoBuy(cryptocode = stringCryptoCode, name = stringCryptoName, price = stringCryptoPrice, quantity = 2.0)

//         btnBuy.setOnClickListener {
//             CoroutineScope(IO).launch {
//                 db.deleteCryptoBuy(stringCryptoCode)
//                 db.insertCryptoBuy(cryptoBuy)
//                 delay(1000)

//                 val listabuys = db.getCryptoBuys(stringCryptoCode)
//                 total = 0.0
//                 for (x in listabuys){
//                     total += x.price
//                 }
//                 withContext(Main){
//                     txtTotal.text = total.toString()
//                 }
//             }
//         }
//     }

// }






