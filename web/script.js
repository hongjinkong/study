// ===== 상태 변수 =====
let posts = [];
let currentDetailId = null;

// ===== 저장소에서 게시글 불러오기 =====
let saved = localStorage.getItem('board-posts');
if (saved) {
  posts = JSON.parse(saved);
} else {
  posts = [];
}

// ===== 다음 게시글 번호 계산 (for문 사용) =====
let getNextId = () => {
  let maxId = 0;
  for (let i = 0; i < posts.length; i++) {
    if (posts[i].id > maxId) {
      maxId = posts[i].id;
    }
  }
  return maxId + 1;
};

// ===== 오늘 날짜 문자열 생성 =====
let getToday = () => {
  let now = new Date();
  let yyyy = now.getFullYear();
  let mm = now.getMonth() + 1;
  let dd = now.getDate();
  if (mm < 10) {
    mm = '0' + mm;
  }
  if (dd < 10) {
    dd = '0' + dd;
  }
  return yyyy + '-' + mm + '-' + dd;
};

// ===== HTML 특수문자 이스케이프 (재사용되므로 이름 있는 화살표 함수) =====
let escapeHtml = (str) => {
  let result = str;
  result = result.replace(/&/g, '&amp;');
  result = result.replace(/</g, '&lt;');
  result = result.replace(/>/g, '&gt;');
  return result;
};

// ===== 게시글 저장 (재사용) =====
let savePosts = () => {
  localStorage.setItem('board-posts', JSON.stringify(posts));
};

// ===== 화면 전환 (재사용) =====
let switchView = (viewName) => {
  let listView = document.getElementById('list-view');
  let writeView = document.getElementById('write-view');
  let detailView = document.getElementById('detail-view');

  listView.classList.add('hidden');
  writeView.classList.add('hidden');
  detailView.classList.add('hidden');

  if (viewName === 'list') {
    listView.classList.remove('hidden');
  }
  if (viewName === 'write') {
    writeView.classList.remove('hidden');
  }
  if (viewName === 'detail') {
    detailView.classList.remove('hidden');
  }
};

// ===== 상세보기 표시 (목록에서 여러 번 호출되므로 재사용 함수) =====
let showDetail = (id) => {
  let target = null;
  for (let i = 0; i < posts.length; i++) {
    if (posts[i].id === id) {
      target = posts[i];
      break;
    }
  }
  if (target === null) {
    return;
  }

  currentDetailId = id;

  document.getElementById('detail-title').innerText = target.title;
  document.getElementById('detail-author').innerText = '작성자: ' + target.author;
  document.getElementById('detail-date').innerText = target.date;
  document.getElementById('detail-content').innerText = target.content;

  switchView('detail');
};

// ===== 목록 렌더링 (여러 곳에서 호출되므로 재사용 함수) =====
let renderList = (filterText) => {
  let listBody = document.getElementById('list-body');
  let emptyMsg = document.getElementById('empty-msg');

  let filtered = [];
  for (let i = 0; i < posts.length; i++) {
    let p = posts[i];
    if (!filterText || p.title.indexOf(filterText) !== -1) {
      filtered.push(p);
    }
  }

  let html = '';
  for (let i = filtered.length - 1; i >= 0; i--) {
    let p = filtered[i];
    html += '<tr id="row-' + p.id + '">';
    html += '<td class="col-no">' + p.id + '</td>';
    html += '<td class="col-title">' + escapeHtml(p.title) + '</td>';
    html += '<td class="col-author">' + escapeHtml(p.author) + '</td>';
    html += '<td class="col-date">' + p.date + '</td>';
    html += '</tr>';
  }

  listBody.innerHTML = html;

  if (filtered.length === 0) {
    emptyMsg.style.display = 'block';
  } else {
    emptyMsg.style.display = 'none';
  }

  // 각 행에 클릭 이벤트 연결 (getElementById만 사용)
  for (let i = 0; i < filtered.length; i++) {
    let p = filtered[i];
    let rowEl = document.getElementById('row-' + p.id);
    rowEl.addEventListener('click', () => {
      showDetail(p.id);
    });
  }
};

// ===== 초기 렌더링 =====
renderList('');

// ===== 글쓰기 버튼 (한 번만 사용되므로 익명 함수) =====
document.getElementById('write-open-btn').addEventListener('click', () => {
  document.getElementById('input-title').value = '';
  document.getElementById('input-author').value = '';
  document.getElementById('input-content').value = '';
  switchView('write');
});

// ===== 글쓰기 취소 버튼 (한 번만 사용되므로 익명 함수) =====
document.getElementById('write-cancel-btn').addEventListener('click', () => {
  switchView('list');
});

// ===== 글쓰기 폼 제출 (한 번만 사용되므로 익명 함수) =====
document.getElementById('write-form').addEventListener('submit', (event) => {
  event.preventDefault();

  let titleInput = document.getElementById('input-title');
  let authorInput = document.getElementById('input-author');
  let contentInput = document.getElementById('input-content');

  let titleValue = titleInput.value.trim();
  let authorValue = authorInput.value.trim();
  let contentValue = contentInput.value.trim();

  if (titleValue === '') {
    alert('제목을 입력해주세요.');
    return;
  }
  if (authorValue === '') {
    alert('작성자를 입력해주세요.');
    return;
  }
  if (contentValue === '') {
    alert('내용을 입력해주세요.');
    return;
  }

  let newPost = {
    id: getNextId(),
    title: titleValue,
    author: authorValue,
    content: contentValue,
    date: getToday()
  };

  posts.push(newPost);
  savePosts();
  renderList('');
  switchView('list');
});

// ===== 검색 버튼 (한 번만 사용되므로 익명 함수) =====
document.getElementById('search-btn').addEventListener('click', () => {
  let keyword = document.getElementById('search-input').value.trim();
  renderList(keyword);
});

// ===== 검색창 엔터키 입력 (한 번만 사용되므로 익명 함수) =====
document.getElementById('search-input').addEventListener('keydown', (event) => {
  if (event.key === 'Enter') {
    let keyword = document.getElementById('search-input').value.trim();
    renderList(keyword);
  }
});

// ===== 상세보기에서 목록으로 이동 (한 번만 사용되므로 익명 함수) =====
document.getElementById('detail-list-btn').addEventListener('click', () => {
  switchView('list');
});

// ===== 게시글 삭제 (한 번만 사용되므로 익명 함수) =====
document.getElementById('detail-delete-btn').addEventListener('click', () => {
  let ok = confirm('이 게시글을 삭제하시겠습니까?');
  if (!ok) {
    return;
  }

  let newPosts = [];
  for (let i = 0; i < posts.length; i++) {
    if (posts[i].id !== currentDetailId) {
      newPosts.push(posts[i]);
    }
  }
  posts = newPosts;

  savePosts();
  renderList('');
  switchView('list');
});
