/*
 * 
*/

package com.toyou.project.controller.elastic;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.search.MatchQuery;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toyou.project.controller.user.api.UserApiController;
import com.toyou.project.dto.ResponseDTO;

@RestController
public class ElasticSearchTestController {

	
	//-----------------------------------------
	// ElasticSearch 포트 오픈 / 닫기 시작
	
	@Autowired
	RestHighLevelClient client;

	// RestHighLevelClient 사용 후 반드시 Close를 해야된다
	// Spring에서 Bean 어노테이션에 destroymethod 속성을 사용해서 해결할 수 있다.
	@Bean(destroyMethod = "close")
	// 어플리케이션에서 요청 시 getBean() 마다 새로운 인스턴스 생성
	@Scope("prototype")
	public RestHighLevelClient restHighLevelClient() {
		return new RestHighLevelClient(RestClient.builder(new HttpHost("192.168.56.105",9200,"http")));
	}
	
	// ElasticSearch 포트 오픈 / 닫기 종료
	//-----------------------------------------


	//-----------------------------------------
	// Ajax 커뮤티니목록_타이틀 검색 시작
	@PostMapping(value = "/auth/esPrefixTitle")
	public ResponseEntity esPrefixTitle(String searhValue) throws IOException {
		
		// 필드 지정(communitytitle 필드에서 검색할 것), 검색할 내용
		QueryBuilder matchQueryBuilder = QueryBuilders.prefixQuery("communitytitle", searhValue);
		SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
		sourceBuilder.query(matchQueryBuilder);
		sourceBuilder.from(0);
		sourceBuilder.size(50);
		
		// 검색할 인덱스 요청
		SearchRequest searchRequest = new SearchRequest("communityprefix");
		searchRequest.source(sourceBuilder);
		SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
		
		// json 으로 값 가져오기
		JSONObject json = new JSONObject(searchResponse.toString());
		
		// 가져온 값 콘솔에 출력
		System.out.println("커뮤니티_타이틀" + json.toMap());
		
		return new ResponseEntity<>(json.toMap(), HttpStatus.OK);		
	}
	// Ajax 커뮤티니목록_타이틀 검색 종료
	//-----------------------------------------
	
	
	//-----------------------------------------
	// Ajax 커뮤티니목록_태그 검색 시작
	@PostMapping(value = "/auth/esPrefixTag")
	public ResponseEntity esPrefixTag(String searhValue) throws IOException {
		
		// 필드 지정(communitytitle 필드에서 검색할 것), 검색할 내용
		QueryBuilder matchQueryBuilder = QueryBuilders.prefixQuery("communitytag", searhValue);
		SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
		sourceBuilder.query(matchQueryBuilder);
		sourceBuilder.from(0);
		sourceBuilder.size(50);
		
		// 검색할 인덱스 요청
		SearchRequest searchRequest = new SearchRequest("communityprefix");
		searchRequest.source(sourceBuilder);
		SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
		
		// json 으로 값 가져오기
		JSONObject json = new JSONObject(searchResponse.toString());
		
		// 가져온 값 콘솔에 출력
		System.out.println("커뮤니티_태그" + json.toMap());
		
		return new ResponseEntity<>(json.toMap(), HttpStatus.OK);		
	}
	// Ajax 커뮤티니목록_태그 검색 종료
	//-----------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-----------------------------------------	
	//-----------------------------------------	
	//-----------------------------------------		
	//-----------------------------------------
	// 인덱스 생성 (필드 세개) (mapping에서 설정한 형식으로 생성된다.)
	// (인덱스 생성한 후에, 딱 한번만 192.168.56.101:5601 에서 인덱싱 추가해주는 작업 해주면 됩니다. 그래야 kibana랑 연동됩니다.)
	
	@PostMapping(value = "/elasticCreate")
	public ResponseDTO<Integer> ping(HttpServletResponse response) throws IOException {
		
		System.out.println("elasticCreate 호출");
		
		// 인덱스 이름 정해주기
		// 주의! 인덱스 이름은 소문자만 가능합니다.
		CreateIndexRequest request = new CreateIndexRequest("20210925test44");
		// 인덱스 안에 샤드와 레플리카 갯수 지정해주기
		request.settings(Settings.builder().put("index.number_of_shards", 2).put("index.number_of_replicas", 3));
		
		// mapping 정보 작성, 필드들의 이름을 지정해주고, 필드의 속성들을 작성해준다.
		// json 형식
		request.mapping(
				"{\n" +
		                "  \"properties\": {\n" +
		                "    \"word\": {\n" +
		                "      \"type\": \"text\",\n" +
		                "        \"fields\": {\n"+
		                "        	\"keyword\": {\n"+
		                "			\"type\": \"keyword\",\n"+
		                "			 \"ignore_above\": 256 \n"+
		                "    					}\n" +
		                " 					 }\n" +
		                "  				}, \n" +
		                "    \"word22\": {\n" +
		                "      \"type\": \"text\",\n" +
		                "        \"fields\": {\n"+
		                "        	\"keyword\": {\n"+
		                "			\"type\": \"keyword\",\n"+
		                "			 \"ignore_above\": 256 \n"+
		                "    					}\n" +
		                " 					 }\n" +
		                "  				}, \n" +		  
		                "    \"date\": {\n" +
		                "      \"type\": \"date\",\n" +
		                "      \"format\": \"yyyy-MM-dd HH:mm:ss||yyyy-MM-dd'T'HH:mm:ss.SSSZ||yyyy/MM/dd||epoch_millis\"\n" +
		                "  				} \n" +		                
		                "  					}\n" +		                
		                "}", 
				XContentType.JSON);
		
		CreateIndexResponse indexResponse = client.indices().create(request, RequestOptions.DEFAULT);
		System.out.println("하핫 성공 : elasticCreated");

		// 페이지 그대로 둘 수 있도록 redirect
		response.sendRedirect("paySuccess");
		// 로그인 세션 유지
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	} 


	
	//-----------------------------------------
	// 인덱스에 키워드 넣기 (필드 세개)
	// upsert = update + insert (업데이트를 진행할 때, 만족하는 로우가 있다면 업데이트를 하고, 없다면 인서트한다.)
	
	// 날짜 형식 포맷 (밖에 있어야 합니다.)
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
	
	@PostMapping(value = "/elasticUpsert")
	public void elasticUpsert(String id, String id22, HttpServletResponse response) throws IOException{

		// 날짜 집어넣기 (안에 있어야 합니다. 안그럼 페이지 호출 시간으로 고정돼서 안 바뀜)
		String dayday = dateFormat.format(new Date());

		// 인덱스에 값들을 넣는다. 
		// id 는 1씩 증가하게 만들었고,
		// 필드의 값은 .source(XContentType.JSON, "필드이름1", "입력값1", "필드이름2", "입력값2") 를 이용해서 넣는다.
		IndexRequest request = new IndexRequest("20210925test44").source(XContentType.JSON, "word", id, "word22", id22, "date", dayday);
		
		IndexResponse indexResponse = client.index(request, RequestOptions.DEFAULT);

		// 페이지 그대로 둘 수 있도록 redirect
		response.sendRedirect("paySuccess");

	}
	

	
	
	//-----------------------------------------	
	// word 필드에 대하여 같은 값에 대하여 그룹핑을 하고, 그 갯수를 출력해주는 기능
	// ELK Dev Tools 에서 아래와 같이 검색했을 때 나오는 결과값을 가져온다.
	
	/*
GET /20210925test44/_search
{
  "size":0,
  "aggs":{
    "group_by_word":{
      "terms": {
        "field": "word.keyword",
        "size": 10
      }
    }
  }
}
	 */
	
	@PostMapping(value = "/elasticSearchCount")
	public ResponseEntity elasticSearchCount(HttpServletResponse response) throws IOException {
		
		// 검색할 인덱스 요청
		SearchRequest searchRequest = new SearchRequest("20210925test44");
		SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
		
		searchSourceBuilder.size(0);
		TermsAggregationBuilder aggregation = AggregationBuilders.terms("group_by_word").field("word.keyword").size(10);
		searchSourceBuilder.aggregation(aggregation);
		searchRequest.source(searchSourceBuilder);
		SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
		
		// json 으로 값 가져오기
		JSONObject json = new JSONObject(searchResponse.toString());

		// 가져온 값 콘솔에 출력
//		System.out.println(json);
//		System.out.println(json.toMap());

		return new ResponseEntity<>(json.toMap(), HttpStatus.OK);
	}
	
	
	
	
	
	// 쓰지 않는다.
	//-----------------------------------------	
	// 커뮤니티 검색 > 커뮤니티 상세페이지로 이동
	// communitytag, communitytitle, communitydescription  필드에서 내가 검색하기 원하는 입력값을 받았을 때 해당 검색값이 있는 것을 출력해준다.
	
	// Ajax 커뮤티니목록 검색 (다중필드에서 검색)
	@PostMapping(value = "/auth/elasticSearchPrefix")
	public ResponseEntity elasticSearchPrefix(String searhValue) throws IOException {
		
		System.out.println("1");
		
		// 필드 지정(communitytitle 필드에서 검색할 것), 검색할 내용
		QueryBuilder matchQueryBuilder = QueryBuilders.multiMatchQuery(searhValue, "communitytag", "communitytitle", "communitydescription").type(MatchQuery.Type.PHRASE_PREFIX);
		
		System.out.println("2");
		
		
		SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
		sourceBuilder.query(matchQueryBuilder);
		sourceBuilder.from(0);
		sourceBuilder.size(50);
		
		System.out.println("3");

		// 검색할 인덱스 요청
		SearchRequest searchRequest = new SearchRequest("communityprefix");
		searchRequest.source(sourceBuilder);
		SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
		
		System.out.println("4");
		
		
		// json 으로 값 가져오기
		JSONObject json = new JSONObject(searchResponse.toString());
		
		// 가져온 값 콘솔에 출력
		System.out.println("************");
		System.out.println(json);
		System.out.println("------------");
		System.out.println(json.toMap());
		System.out.println("************");
		
		
		// return new ResponseEntity<>(json.toMap(), HttpStatus.OK);		
		return new ResponseEntity<>(json.toMap(), HttpStatus.OK);
	}	
	
	
}


