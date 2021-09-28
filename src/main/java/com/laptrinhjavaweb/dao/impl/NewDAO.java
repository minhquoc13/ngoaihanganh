package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.github.slugify.Slugify;
import com.laptrinhjavaweb.dao.INewDAO;
import com.laptrinhjavaweb.mapper.NewMapper;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.paging.Pageble;

public class NewDAO extends AbstractDAO<NewModel> implements INewDAO {

	@Override
	public List<NewModel> findByCategoryId(Long categoryId) {
		String sql = "SELECT * FROM news WHERE categoryid = ?";
		return query(sql, new NewMapper(), categoryId);
	}

	public NewModel findNewBySlug(String slug) {
		String sql = "SELECT * FROM news WHERE slug = ?";
		return query(sql, new NewMapper(), slug).get(0);
	}

	@Override
	public Long save(NewModel newModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO news (title, content,");
		sql.append(" thumbnail, shortdescription, categoryid, rate, createddate, createdby)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), newModel.getTitle(), newModel.getContent(), newModel.getThumbnail(),
				newModel.getShortDescription(), newModel.getCategoryId(), newModel.getRate(), newModel.getCreatedDate(),
				newModel.getCreatedBy());
	}

	@Override
	public NewModel findOne(Long id) {
		String sql = "SELECT * FROM news WHERE id = ?";
		List<NewModel> news = query(sql, new NewMapper(), id);
		return news.isEmpty() ? null : news.get(0);
	}

	@Override
	public void update(NewModel updateNew) {
		StringBuilder sql = new StringBuilder("UPDATE news SET title = ?, thumbnail = ?,");
		sql.append(" shortdescription = ?, content = ?, categoryid = ?, rate = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateNew.getTitle(), updateNew.getThumbnail(), updateNew.getShortDescription(),
				updateNew.getContent(), updateNew.getCategoryId(), updateNew.getRate(), updateNew.getCreatedDate(),
				updateNew.getCreatedBy(), updateNew.getModifiedDate(), updateNew.getModifiedBy(), updateNew.getId());
	}

	@Override
	public void delete(long id) {
		String sql = "DELETE FROM news WHERE id = ?";
		update(sql, id);
	}

	@Override
	public List<NewModel> findAll(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM news");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName())
				&& StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
		}
		return query(sql.toString(), new NewMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM news";
		return count(sql);
	}

	public List<NewModel> getNext3New(int amount) {
		String sql = "SELECT * FROM news where categoryid <8 ORDER BY ID DESC LIMIT 3 OFFSET ?";
		return query(sql, new NewMapper(), amount);
	}

	public List<NewModel> getNext3Video(int amount) {
		String sql = "SELECT * FROM news where categoryid = 8 ORDER BY ID DESC LIMIT 3 OFFSET ?";
		return query(sql, new NewMapper(), amount);
	}

	public List<NewModel> searchNewAjax(String txtSearch) {
		String sql = "select * from news  where title like ? and categoryid != 8 order by id desc";
		return query(sql, new NewMapper(), "%" + txtSearch + "%");
	}

	public List<NewModel> searchVideoAjax(String txtSearch) {
		String sql = "select * from news  where title like ? and categoryid = 8 order by id desc";
		return query(sql, new NewMapper(), "%" + txtSearch + "%");
	}

	@Override
	public List<NewModel> getAllNew() {
		String sql = "select * from news where categoryid !=8 order by id desc";
		return query(sql, new NewMapper());
	}

	@Override
	public List<NewModel> get4New() {
		String sql = "select * from news where categoryid != 8 and rate!= 1 order by id desc limit 4";
		return query(sql, new NewMapper());
	}

	@Override
	public List<NewModel> getHeroNew() {
		String sql = "select * from news where categoryid != 8 and rate = 1 order by id desc limit 3";
		return query(sql, new NewMapper());
	}

	public NewModel getTinCongDong() {
		String sql = "select * from news where categoryid = 3 order by id desc limit 1";
		return query(sql, new NewMapper()).get(0);
	}

	public NewModel getTinChuyenNhuong() {
		String sql = "select * from news where categoryid = 6 order by id desc limit 1";
		return query(sql, new NewMapper()).get(0);
	}

	public List<NewModel> getTinNgauNhien(Long id) {
		String sql = "select * from news where categoryid != 8 and id != ? order by RAND() limit 4";
		return query(sql, new NewMapper(), id);
	}

	@Override
	public List<NewModel> getAllVideo() {
		String sql = "select * from news where categoryid = 8 order by id desc";
		return query(sql, new NewMapper());
	}

	@Override
	public List<NewModel> getHeroVideo() {
		String sql = "SELECT * FROM news WHERE categoryid = 8 and rate =1 ORDER BY ID desc LIMIT 1";
		return query(sql, new NewMapper());
	}

	@Override
	public List<NewModel> get4Video() {
		String sql = "SELECT * FROM news where categoryid =8 and rate !=1\n" + "ORDER BY id DESC\n" + "LIMIT 4";
		return query(sql, new NewMapper());
	}

	public NewModel findNewById(String id) {
		String sql = "SELECT * FROM news WHERE id = ?";
		return query(sql, new NewMapper(), id).get(0);
	}

//	public void AddViewNew(String id) {
//		Connection connection = null;
//		PreparedStatement statement = null;
//		String sql = "UPDATE news SET view = view +1 where id = ?";		
//		try {
//			connection = getConnection();
//			statement = connection.prepareStatement(sql);
//			statement.setString(1, id);
//			statement.executeUpdate();
//		} catch (SQLException e) {
//			System.out.print(e);
//		} finally {
//			try {
//				if (connection != null) {
//					connection.close();
//				}
//				if (statement != null) {
//					statement.close();
//				}
//			} catch (SQLException e) {
//			}
//		}
//	}
	public void AddViewNew(Long id) {
		String sql = "UPDATE news SET view = view +1 where id = ?";
		update(sql, id);
	}

	public void updateSlug(Long id, String title) {
		Slugify slg = new Slugify().withTransliterator(true).withUnderscoreSeparator(true);
		String slug = slg.slugify(title);
		String sql = "UPDATE news SET slug = ? where id = ?";
		update(sql, slug, id);
	}

	public static void main(String[] args) {
		NewDAO dao = new NewDAO();
		List<NewModel> list = dao.searchNewAjax("a");
		for (NewModel n : list) {
			System.out.print(n);
		}
	}

}
