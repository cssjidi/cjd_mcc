<?php
class ModelCatalogUrlAlias extends Model {
	public function getUrlAliasByQuery($seo_query) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $this->db->escape($seo_query) . "'");

		return $query->row;
	}
}