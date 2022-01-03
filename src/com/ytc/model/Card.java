package com.ytc.model;
import java.util.Objects;
public class Card {
    private Integer id;
    private Integer number;
    private Bank bank;
    private User user;

    public Card() {
    }

    public Card(Integer id, Integer number, Bank bank, User user) {
        this.id = id;
        this.number = number;
        this.bank = bank;
        this.user = user;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNumber() {
        return this.number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Bank getBank() {
        return this.bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Card id(Integer id) {
        setId(id);
        return this;
    }

    public Card number(Integer number) {
        setNumber(number);
        return this;
    }

    public Card bank(Bank bank) {
        setBank(bank);
        return this;
    }

    public Card user(User user) {
        setUser(user);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Card)) {
            return false;
        }
        Card card = (Card) o;
        return Objects.equals(id, card.id) && Objects.equals(number, card.number) && Objects.equals(bank, card.bank) && Objects.equals(user, card.user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, number, bank, user);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", number='" + getNumber() + "'" +
            ", bank='" + getBank() + "'" +
            ", user='" + getUser() + "'" +
            "}";
    }

}