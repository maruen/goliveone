package br.com.golive.constants;

/**
 * @author guilherme.duarte
 *         Constante que define os tipos de criptografias utilizadas para login de usuários.
 *         Default = SHA-1
 */

public enum Criptografia {

    MD5("MD5"),
    SHA_1("SHA-1"),
    SHA_256("SHA-256");

    private String codigo;

    private Criptografia(final String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

}
