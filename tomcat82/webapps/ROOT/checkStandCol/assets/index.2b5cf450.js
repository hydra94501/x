import {r as e, c as r, a as t, o as n, b as s, d as o, e as i, V as a} from "./vendor.45be892f.js";

const d = {name: "App"}, l = {id: "app"};
let u;
d.render = function (s, o, i, a, d, u) {
    const p = e("router-view");
    return n(), r("div", l, [t(p)])
};
const p = {}, c = [{
    path: "/", name: "Index", component: () => function (e, r) {
        if (!r || 0 === r.length) return e();
        if (void 0 === u) {
            const e = document.createElement("link").relList;
            u = e && e.supports && e.supports("modulepreload") ? "modulepreload" : "preload"
        }
        return Promise.all(r.map((e => {
            if ((e = `/${e}`) in p) return;
            p[e] = !0;
            const r = e.endsWith(".css"), t = r ? '[rel="stylesheet"]' : "";
            if (document.querySelector(`link[href="${e}"]${t}`)) return;
            const n = document.createElement("link");
            return n.rel = r ? "stylesheet" : u, r || (n.as = "script", n.crossOrigin = ""), n.href = e, document.head.appendChild(n), r ? new Promise(((e, r) => {
                n.addEventListener("load", e), n.addEventListener("error", r)
            })) : void 0
        }))).then((() => e()))
    }((() => import("./index.742bb990.js")), ["assets/index.742bb990.js", "assets/index.1141172a.css", "assets/vendor.45be892f.js"])
}], m = s({history: o(), routes: c});
i(d).use(a).use(m).mount("#app");
