package br.com.golive.entity.database.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the tbDatabaseAddress database table.
 * 
 */
@Entity
@Table(name="tbDatabaseAddress")
@NamedQuery(name = "TbDatabaseAddress.findAll", query = "SELECT t FROM EnderecoBase t")
public class EnderecoBase implements Serializable {

	private static final long serialVersionUID = 7167595165927431955L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Id")
	private Long id;

	@Column(name="IpAddressBloc1")
	private Long ipAddressBloc1;

	@Column(name="IpAddressBloc2")
	private Long ipAddressBloc2;

	@Column(name="IpAddressBloc3")
	private Long ipAddressBloc3;

	@Column(name="IpAddressBloc4")
	private Long ipAddressBloc4;

	@Column(name="Port")
	private Long port;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="SystemChangeDateTime")
	private Date systemChangeDateTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="SystemIncludeDateTime")
	private Date systemIncludeDateTime;

}