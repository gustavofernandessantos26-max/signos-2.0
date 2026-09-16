<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Descubra seu Signo — Jogo Estelar</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&family=Fredoka:wght@400;600;700&display=swap');

    :root {
      --gold: #ffd76a;
      --pink: #ff7ab6;
      --cyan: #6ef0ff;
      --purple: #7b5cff;
      --bg: #0b0620;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      min-height: 100vh;
      background:
        radial-gradient(ellipse at 20% 10%, #2a1260 0%, transparent 50%),
        radial-gradient(ellipse at 80% 90%, #1a0a40 0%, transparent 45%),
        linear-gradient(180deg, #070414 0%, #140a32 50%, #0b0620 100%);
      color: #fff;
      font-family: 'Fredoka', sans-serif;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .stars, .stars2, .stars3 {
      position: fixed; inset: 0; pointer-events: none; z-index: 0;
    }
    .stars { background: transparent url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="2" height="2"><circle cx="1" cy="1" r="1" fill="white"/></svg>') repeat; background-size: 80px 80px; opacity: .55; animation: twinkle 4s linear infinite; }
    .stars2 { background: transparent url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="2" height="2"><circle cx="1" cy="1" r="1" fill="%23ffd76a"/></svg>') repeat; background-size: 140px 140px; opacity: .35; animation: twinkle 7s linear infinite reverse; }
    .stars3 { background: transparent url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="3" height="3"><circle cx="1.5" cy="1.5" r="1.2" fill="%236ef0ff"/></svg>') repeat; background-size: 220px 220px; opacity: .25; animation: twinkle 11s linear infinite; }

    @keyframes twinkle {
      0%, 100% { opacity: .3; }
      50% { opacity: .7; }
    }

    .game {
      position: relative;
      z-index: 2;
      width: min(920px, 96vw);
      height: min(640px, 92vh);
      background: linear-gradient(160deg, rgba(40,18,90,.85), rgba(12,8,30,.92));
      border: 4px solid var(--gold);
      border-radius: 18px;
      box-shadow:
        0 0 0 6px #3a2060,
        0 0 40px rgba(255, 215, 106, .35),
        inset 0 0 60px rgba(123, 92, 255, .25);
      overflow: hidden;
      display: flex;
      flex-direction: column;
    }

    .topbar {
      background: linear-gradient(90deg, #3a1570, #1a0a40);
      padding: 10px 16px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 3px solid var(--gold);
      font-family: 'Press Start 2P', cursive;
      font-size: 10px;
      letter-spacing: 1px;
    }
    .topbar span { color: var(--gold); }

    .screen {
      flex: 1;
      display: none;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 24px 20px;
      text-align: center;
      animation: fadeIn .4s ease;
    }
    .screen.active { display: flex; }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(12px); }
      to { opacity: 1; transform: none; }
    }

    h1 {
      font-family: 'Press Start 2P', cursive;
      font-size: clamp(16px, 3vw, 26px);
      color: var(--gold);
      text-shadow: 0 0 12px #ffb000, 3px 3px 0 #4a2080;
      line-height: 1.5;
      margin-bottom: 12px;
    }

    h2 {
      font-size: clamp(22px, 4vw, 34px);
      margin-bottom: 8px;
    }

    p.lead {
      font-size: 18px;
      max-width: 520px;
      margin: 8px 0 22px;
      color: #e8d9ff;
    }

    .btn {
      cursor: pointer;
      border: 3px solid #fff;
      background: linear-gradient(180deg, #ff8ad4, #c43a8a);
      color: #fff;
      font-family: 'Fredoka', sans-serif;
      font-weight: 700;
      font-size: 20px;
      padding: 12px 28px;
      border-radius: 14px;
      box-shadow: 0 6px 0 #7a1d55, 0 8px 16px rgba(0,0,0,.35);
      transition: transform .12s, box-shadow .12s;
      text-transform: uppercase;
    }
    .btn:hover { transform: translateY(-2px); }
    .btn:active { transform: translateY(4px); box-shadow: 0 2px 0 #7a1d55; }

    .btn.gold {
      background: linear-gradient(180deg, #ffe08a, #e0a020);
      color: #3a2000;
      box-shadow: 0 6px 0 #8a6200, 0 8px 16px rgba(0,0,0,.35);
    }
    .btn.cyan {
      background: linear-gradient(180deg, #8af4ff, #2ab0c8);
      color: #063038;
      box-shadow: 0 6px 0 #156878, 0 8px 16px rgba(0,0,0,.35);
    }

    .months, .days {
      display: grid;
      gap: 8px;
      width: 100%;
      max-width: 720px;
    }
    .months { grid-template-columns: repeat(4, 1fr); }
    .days { grid-template-columns: repeat(8, 1fr); max-width: 640px; }

    .chip {
      cursor: pointer;
      border: 2px solid #fff;
      background: linear-gradient(180deg, #6b4cff, #3a1ea0);
      color: #fff;
      font-weight: 700;
      padding: 10px 6px;
      border-radius: 10px;
      font-size: 14px;
      box-shadow: 0 4px 0 #221060;
      transition: transform .1s;
    }
    .chip:hover { transform: translateY(-2px) scale(1.04); }
    .chip.selected { background: linear-gradient(180deg, #ffd76a, #e0a020); color: #3a2000; }

    .crystal {
      font-size: 72px;
      animation: float 2.4s ease-in-out infinite;
      filter: drop-shadow(0 0 16px #ffd76a);
      margin: 8px 0 16px;
    }

    @keyframes float {
      0%,100% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
    }

    .loading-bar {
      width: 280px;
      height: 18px;
      border: 3px solid var(--gold);
      border-radius: 20px;
      overflow: hidden;
      background: #1a0a40;
      margin-top: 16px;
    }
    .loading-bar > i {
      display: block;
      height: 100%;
      width: 0;
      background: linear-gradient(90deg, var(--pink), var(--gold), var(--cyan));
      animation: load 2.2s ease forwards;
    }
    @keyframes load { to { width: 100%; } }

    .sign-symbol {
      font-size: 84px;
      line-height: 1;
      filter: drop-shadow(0 0 18px var(--gold));
      animation: pop .5s ease;
    }
    @keyframes pop {
      0% { transform: scale(.4) rotate(-12deg); opacity: 0; }
      100% { transform: scale(1) rotate(0); opacity: 1; }
    }

    .sign-name {
      font-family: 'Press Start 2P', cursive;
      font-size: clamp(18px, 3.4vw, 28px);
      color: var(--gold);
      margin: 8px 0 12px;
      text-shadow: 0 0 10px #ffb000;
    }

    .desc {
      background: rgba(255,255,255,.08);
      border: 2px dashed var(--cyan);
      border-radius: 14px;
      padding: 14px 18px;
      max-width: 540px;
      font-size: 18px;
      color: #fff6d8;
    }

    .row { display: flex; gap: 12px; margin-top: 22px; flex-wrap: wrap; justify-content: center; }

    .hint { font-size: 14px; color: #cbb8ff; margin-top: 10px; }

    @media (max-width: 640px) {
      .months { grid-template-columns: repeat(3, 1fr); }
      .days { grid-template-columns: repeat(6, 1fr); }
      .chip { font-size: 12px; padding: 8px 4px; }
      .game { height: 94vh; }
    }
  </style>
</head>
<body>
  <div class="stars"></div>
  <div class="stars2"></div>
  <div class="stars3"></div>

  <div class="game">
    <div class="topbar">
      <span>★ JOGO ESTELAR v1.0</span>
      <span id="lives">✦ ✦ ✦</span>
    </div>

    <section id="start" class="screen active">
      <div class="crystal">🔮</div>
      <h1>DESCUBRA<br>SEU SIGNO</h1>
      <p class="lead">Entre no oráculo das estrelas e descubra qual signo brilha no seu céu de aniversário!</p>
      <button class="btn gold" onclick="go('month')">▶ Jogar</button>
      <p class="hint">Um mini-jogo no estilo dos antigos jogos Flash</p>
    </section>

    <section id="month" class="screen">
      <h2>📅 Qual o mês do seu aniversário?</h2>
      <p class="lead">Toque no mês para continuar.</p>
      <div class="months" id="monthGrid"></div>
    </section>

    <section id="day" class="screen">
      <h2>🎂 Qual o dia?</h2>
      <p class="lead" id="dayLead">Escolha o dia do mês.</p>
      <div class="days" id="dayGrid"></div>
      <div class="row">
        <button class="btn cyan" onclick="go('month')">↩ Voltar</button>
      </div>
    </section>

    <section id="loading" class="screen">
      <div class="crystal">✨</div>
      <h2>Consultando as estrelas...</h2>
      <p class="lead">Os planetas estão se alinhando para revelar o seu signo!</p>
      <div class="loading-bar"><i></i></div>
    </section>

    <section id="result" class="screen">
      <div class="sign-symbol" id="symbol">♈</div>
      <div class="sign-name" id="signName">ÁRIES</div>
      <div class="desc" id="desc"></div>
      <div class="row">
        <button class="btn gold" onclick="resetGame()">★ Jogar de novo</button>
      </div>
    </section>
  </div>

  <script>
    const MESES = [
      { n: 1, nome: 'Janeiro' }, { n: 2, nome: 'Fevereiro' }, { n: 3, nome: 'Março' },
      { n: 4, nome: 'Abril' }, { n: 5, nome: 'Maio' }, { n: 6, nome: 'Junho' },
      { n: 7, nome: 'Julho' }, { n: 8, nome: 'Agosto' }, { n: 9, nome: 'Setembro' },
      { n: 10, nome: 'Outubro' }, { n: 11, nome: 'Novembro' }, { n: 12, nome: 'Dezembro' }
    ];

    const SIGNOS = {
      aries:      { nome: 'Áries',      simbolo: '♈', frase: 'Você é corajoso, cheio de energia e adora começar aventuras novas. Um verdadeiro herói das estrelas!' },
      touro:      { nome: 'Touro',      simbolo: '♉', frase: 'Você é calmo, determinado e gosta de coisas gostosas e confortáveis. Uma força tranquila e leal!' },
      gemeos:     { nome: 'Gêmeos',     simbolo: '♊', frase: 'Você é curioso, conversador e adora aprender. Tem duas ideias brilhantes ao mesmo tempo!' },
      cancer:     { nome: 'Câncer',     simbolo: '♋', frase: 'Você é carinhoso, protetor e sente as coisas com o coração. Um amigo que abraça o mundo!' },
      leao:       { nome: 'Leão',       simbolo: '♌', frase: 'Você brilha como o Sol! Criativo, generoso e nascido para liderar com um sorriso enorme.' },
      virgem:     { nome: 'Virgem',     simbolo: '♍', frase: 'Você é organizado, atento aos detalhes e adora ajudar. Um detetive das pequenas coisas importantes!' },
      libra:      { nome: 'Libra',      simbolo: '♎', frase: 'Você ama harmonia, beleza e justiça. Sempre busca o equilíbrio e a paz entre os amigos.' },
      escorpiao:  { nome: 'Escorpião',  simbolo: '♏', frase: 'Você é intenso, leal e misterioso. Quando gosta de alguém, defende com toda a força!' },
      sagitario:  { nome: 'Sagitário',  simbolo: '♐', frase: 'Você é aventureiro, otimista e adora explorar. O céu é o limite para a sua curiosidade!' },
      capricornio:{ nome: 'Capricórnio',simbolo: '♑', frase: 'Você é responsável, persistente e sobe qualquer montanha. Um construtor de sonhos passo a passo!' },
      aquario:    { nome: 'Aquário',    simbolo: '♒', frase: 'Você é original, amigável e pensa no futuro. Traz ideias novas que iluminam o grupo!' },
      peixes:     { nome: 'Peixes',     simbolo: '♓', frase: 'Você é sonhador, gentil e imaginativo. Navega num oceano de ideias e bondade!' }
    };

    let mesEscolhido = null;
    let diaEscolhido = null;

    function go(id) {
      document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
      document.getElementById(id).classList.add('active');
    }

    function diasNoMes(mes) {
      return [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][mes - 1];
    }

    function descobrirSigno(dia, mes) {
      if ((mes === 3 && dia >= 21) || (mes === 4 && dia <= 19)) return SIGNOS.aries;
      if ((mes === 4 && dia >= 20) || (mes === 5 && dia <= 20)) return SIGNOS.touro;
      if ((mes === 5 && dia >= 21) || (mes === 6 && dia <= 20)) return SIGNOS.gemeos;
      if ((mes === 6 && dia >= 21) || (mes === 7 && dia <= 22)) return SIGNOS.cancer;
      if ((mes === 7 && dia >= 23) || (mes === 8 && dia <= 22)) return SIGNOS.leao;
      if ((mes === 8 && dia >= 23) || (mes === 9 && dia <= 22)) return SIGNOS.virgem;
      if ((mes === 9 && dia >= 23) || (mes === 10 && dia <= 22)) return SIGNOS.libra;
      if ((mes === 10 && dia >= 23) || (mes === 11 && dia <= 21)) return SIGNOS.escorpiao;
      if ((mes === 11 && dia >= 22) || (mes === 12 && dia <= 21)) return SIGNOS.sagitario;
      if ((mes === 12 && dia >= 22) || (mes === 1 && dia <= 19)) return SIGNOS.capricornio;
      if ((mes === 1 && dia >= 20) || (mes === 2 && dia <= 18)) return SIGNOS.aquario;
      return SIGNOS.peixes;
    }

    function montarMeses() {
      const grid = document.getElementById('monthGrid');
      grid.innerHTML = '';
      MESES.forEach(m => {
        const b = document.createElement('button');
        b.className = 'chip';
        b.textContent = m.nome;
        b.onclick = () => escolherMes(m.n, m.nome);
        grid.appendChild(b);
      });
    }

    function escolherMes(n, nome) {
      mesEscolhido = n;
      document.getElementById('dayLead').textContent = 'Mês escolhido: ' + nome + '. Agora o dia!';
      const grid = document.getElementById('dayGrid');
      grid.innerHTML = '';
      const max = diasNoMes(n);
      for (let d = 1; d <= max; d++) {
        const b = document.createElement('button');
        b.className = 'chip';
        b.textContent = d;
        b.onclick = () => escolherDia(d);
        grid.appendChild(b);
      }
      go('day');
    }

    function escolherDia(d) {
      diaEscolhido = d;
      go('loading');
      setTimeout(mostrarResultado, 2300);
    }

    function mostrarResultado() {
      const s = descobrirSigno(diaEscolhido, mesEscolhido);
      document.getElementById('symbol').textContent = s.simbolo;
      document.getElementById('signName').textContent = s.nome.toUpperCase();
      document.getElementById('desc').textContent = s.frase;
      go('result');
    }

    function resetGame() {
      mesEscolhido = null;
      diaEscolhido = null;
      go('start');
    }

    montarMeses();
  </script>
</body>
</html>
