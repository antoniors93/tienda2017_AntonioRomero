/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class Pedido {
    
    private int IdPedido;
    private Date Fecha;
    private char Estado;
    private int IdCliente;
    private double BaseImponible;
    private double Descuento;
    private double GastosEnvio;
    private double Iba;
    private int IdDireccion;
    private ArrayList<LineaPedido> LineasPedido;

    public ArrayList<LineaPedido> getLineasPedido() {
        return LineasPedido;
    }

    public void setLineasPedido(ArrayList<LineaPedido> LineasPedido) {
        this.LineasPedido = LineasPedido;
    }

    public int getIdPedido() {
        return IdPedido;
    }

    public void setIdPedido(int IdPedido) {
        this.IdPedido = IdPedido;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public char getEstado() {
        return Estado;
    }

    public void setEstado(char Estado) {
        this.Estado = Estado;
    }

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
    }

    public double getBaseImponible() {
        return BaseImponible;
    }

    public void setBaseImponible(double BaseImponible) {
        this.BaseImponible = BaseImponible;
    }

    public double getDescuento() {
        return Descuento;
    }

    public void setDescuento(double Descuento) {
        this.Descuento = Descuento;
    }

    public double getGastosEnvio() {
        return GastosEnvio;
    }

    public void setGastosEnvio(double GastosEnvio) {
        this.GastosEnvio = GastosEnvio;
    }

    public double getIba() {
        return Iba;
    }

    public void setIba(double Iba) {
        this.Iba = Iba;
    }

    public int getIdDireccion() {
        return IdDireccion;
    }

    public void setIdDireccion(int IdDireccion) {
        this.IdDireccion = IdDireccion;
    }
}
