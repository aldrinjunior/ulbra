package com.example.coronga_app

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.note_item.view.*

class NodeListAdapter(private val notes: List<Card>, private val onItemClicked : onItemClickListener): RecyclerView.Adapter<NodeListAdapter.ViewHolder>() {

    interface onItemClickListener {
        fun onItemClicked ( note: Card)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.note_item, parent, false);
        return ViewHolder(view);
    }

    override fun getItemCount(): Int {
        return notes.size;
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val note = notes[position];
        holder.bindView(note, onItemClicked );
    }

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        fun bindView(note: Card, onItemClicked: onItemClickListener) {
            val title = itemView.note_item_title
            val numero_mortos = itemView.numero_mortos
            val numero_suspeitos = itemView.numero_suspeitos
            val numero_recusados = itemView.numero_recusados

            title.text = note.titulo
            numero_mortos.text = formatNumber(note.mortos)
            numero_suspeitos.text = formatNumber(note.suspeitos)
            numero_recusados.text = note.recusados

            itemView.setOnClickListener{
                onItemClicked.onItemClicked(note);
            }
        }

        private fun formatNumber(number: Int): String {
            return if (number < 1000) {
                number.toString()
            } else {
                (number / 1000).toString() + " k"
            }
        }
    }

}

