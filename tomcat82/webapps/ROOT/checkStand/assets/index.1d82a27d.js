import {
    p as e,
    a,
    T as t,
    r as l,
    c as n,
    b as c,
    w as s,
    F as o,
    o as i,
    d as r,
    e as d,
    f as p,
    V as u
} from "./vendor.24a775d0.js";

!function () {
    const e = document.createElement("link").relList;
    if (!(e && e.supports && e.supports("modulepreload"))) {
        for (const e of document.querySelectorAll('link[rel="modulepreload"]')) a(e);
        new MutationObserver((e => {
            for (const t of e) if ("childList" === t.type) for (const e of t.addedNodes) "LINK" === e.tagName && "modulepreload" === e.rel && a(e)
        })).observe(document, {childList: !0, subtree: !0})
    }

    function a(e) {
        if (e.ep) return;
        e.ep = !0;
        const a = function (e) {
            const a = {};
            return e.integrity && (a.integrity = e.integrity), e.referrerpolicy && (a.referrerPolicy = e.referrerpolicy), "use-credentials" === e.crossorigin ? a.credentials = "include" : "anonymous" === e.crossorigin ? a.credentials = "omit" : a.credentials = "same-origin", a
        }(e);
        fetch(e.href, a)
    }
}();
const f = {
    setup: () => ({
        copy: () => {
            let e = document.getElementById("var_4").innerText, a = document.createElement("textarea");
            a.value = e, document.body.appendChild(a), a.select(), document.execCommand("Copy"), console.log("copy success"), a.remove(), t("Copiar éxito")
        }
    }), mounted() {
        const e = window.location.search.substring(1).split("&");
        let [a = "#", t = "#", l = "#", n = "#"] = [];
        e.forEach((e => {
            let c = e.split("=");
            "v1" === c[0] ? a = c[1] : "v2" === c[0] ? t = c[1] : "v3" === c[0] ? l = c[1] : "v4" === c[0] && (n = c[1])
        })), document.getElementById("var_1").innerText = a, document.getElementById("var_2").innerText = t, document.getElementById("var_3").innerText = l, document.getElementById("var_4").innerText = n
    }, data: () => ({})
};
e("data-v-20655ba5");
const v = r("span", {class: "title"}, "Monto:", -1),
    m = r("span", {class: "value money"}, [d("MXN "), r("span", {id: "var_1"})], -1),
    h = r("span", {class: "title"}, "La Orden No:", -1),
    g = r("span", {class: "value"}, [r("span", {id: "var_2"})], -1), w = r("span", {class: "title"}, "Productos:", -1),
    _ = r("span", {class: "value"}, [r("span", {id: "var_3"})], -1), y = d("CLABE:"),
    z = [r("span", {id: "var_4"}, null, -1)], x = r("svg", {
        t: "1629094924799",
        class: "icon",
        viewBox: "0 0 1024 1024",
        version: "1.1",
        xmlns: "http://www.w3.org/2000/svg",
        "p-id": "1214",
        width: "50",
        height: "50"
    }, [r("path", {
        d: "M931.84 675.84c0 12.288-8.192 20.48-20.48 20.48s-20.48-8.192-20.48-20.48V419.84c0-34.816-26.624-61.44-61.44-61.44h-409.6c-34.816 0-61.44 26.624-61.44 61.44v409.6c0 34.816 26.624 61.44 61.44 61.44h409.6c34.816 0 61.44-26.624 61.44-61.44v-45.056c0-12.288 8.192-20.48 20.48-20.48s20.48 8.192 20.48 20.48v45.056c0 57.344-45.056 102.4-102.4 102.4h-409.6c-57.344 0-102.4-45.056-102.4-102.4v-409.6c0-57.344 45.056-102.4 102.4-102.4h409.6c57.344 0 102.4 45.056 102.4 102.4v256z m-225.28-454.656c0 12.288-8.192 20.48-20.48 20.48s-20.48-8.192-20.48-20.48V194.56c0-34.816-26.624-61.44-61.44-61.44h-409.6c-34.816 0-61.44 26.624-61.44 61.44v409.6c0 34.816 26.624 61.44 61.44 61.44h32.768c12.288 0 20.48 8.192 20.48 20.48s-8.192 20.48-20.48 20.48h-32.768c-57.344 0-102.4-45.056-102.4-102.4v-409.6c0-57.344 45.056-102.4 102.4-102.4h409.6c57.344 0 102.4 45.056 102.4 102.4v26.624z",
        "p-id": "1215"
    })], -1), C = r("span", {class: "copy-text"}, "Copiar", -1), b = r("svg", {
        t: "1629101552603",
        class: "icon",
        viewBox: "0 0 1024 1024",
        version: "1.1",
        xmlns: "http://www.w3.org/2000/svg",
        "p-id": "2843",
        width: "50",
        height: "50"
    }, [r("path", {
        d: "M960 512v448H256V256h448z m-320 64l-0.896-192H384v448h448v-254.816zM192 768H64V64h576v128H192v576z",
        fill: "#0590DF",
        "p-id": "2844"
    })], -1), M = d('En el lado derecho de la cuenta CLABE arriba, haga clic en "Copiar" para copiar la cuenta Clabe'),
    B = r("svg", {
        t: "1629102711248",
        class: "icon",
        viewBox: "0 0 1024 1024",
        version: "1.1",
        xmlns: "http://www.w3.org/2000/svg",
        "p-id": "4185",
        width: "50",
        height: "50"
    }, [r("path", {
        d: "M512 1024C229.225412 1024 0 794.774588 0 512S229.225412 0 512 0s512 229.225412 512 512-229.225412 512-512 512z m0-120.470588c216.244706 0 391.529412-175.284706 391.529412-391.529412S728.244706 120.470588 512 120.470588 120.470588 295.755294 120.470588 512s175.284706 391.529412 391.529412 391.529412z m-75.294118-421.647059H256l180.705882-195.764706v75.294118h331.294118v120.470588H436.705882z m150.588236 60.235294h180.705882L587.294118 737.882353v-75.294118H256v-120.470588h331.294118z",
        fill: "#0590DF",
        "p-id": "4186"
    })], -1),
    A = d("Abra la banca móvil, seleccione la transferencia STP en la banca móvil, pegue el número de cuenta de Clabe copiado en el área correcta y complete correctamente otra información relacionada con la transferencia, y confirme que el monto de la transferencia sea consistente con el monto del pedido. ( Consulte el ejemplo a continuación)"),
    E = r("svg", {
        t: "1629102937738",
        class: "icon",
        viewBox: "0 0 1024 1024",
        version: "1.1",
        xmlns: "http://www.w3.org/2000/svg",
        "p-id": "6752",
        width: "50",
        height: "50"
    }, [r("path", {
        d: "M512 1024C230.4 1024 0 793.6 0 512S230.4 0 512 0s512 230.4 512 512c0 30.72-20.48 51.2-51.2 51.2s-51.2-20.48-51.2-51.2c0-225.28-184.32-409.6-409.6-409.6s-409.6 184.32-409.6 409.6 184.32 409.6 409.6 409.6c30.72 0 51.2 20.48 51.2 51.2s-20.48 51.2-51.2 51.2z",
        "p-id": "6753",
        fill: "#0590DF"
    }), r("path", {
        d: "M1008.64 670.72c-20.48-20.48-51.2-20.48-71.68 0l-179.2 179.2-107.52-107.52c-20.48-20.48-51.2-20.48-71.68 0s-20.48 51.2 0 71.68l143.36 143.36c20.48 20.48 51.2 20.48 71.68 0l215.04-215.04c20.48-20.48 20.48-56.32 0-71.68z",
        "p-id": "6754",
        fill: "#0590DF"
    })], -1),
    F = d("Después de confirmar que la transferencia se realizó correctamente, haga clic en Atrás para confirmar el pago."),
    H = r("a", {href: "https://wa.me/529671247180", target: "_blank"}, [r("svg", {
        t: "1631690880528",
        class: "icon",
        viewBox: "0 0 1024 1024",
        version: "1.1",
        xmlns: "http://www.w3.org/2000/svg",
        "p-id": "2792",
        width: "50",
        height: "50"
    }, [r("path", {
        d: "M985.742 749.896c0 130.902-106.178 237.004-237.13 237.004H274.336c-130.994 0-237.132-106.102-237.132-237.004V276.018c0-130.902 106.138-236.966 237.132-236.966h474.274c130.954 0 237.13 106.064 237.13 236.966v473.878z",
        fill: "#00C451",
        "p-id": "2793"
    }), r("path", {
        d: "M807.894 505.384c0 159.354-130.298 288.558-291.048 288.558-51.026 0-98.962-13.04-140.684-35.908l-161.11 51.14 52.53-154.812c-26.514-43.504-41.762-94.494-41.762-149.018 0-159.364 130.3-288.568 291.024-288.568 160.752 0.002 291.05 129.206 291.05 288.608zM516.846 262.75c-134.934 0-244.67 108.838-244.67 242.634 0 53.058 17.33 102.234 46.604 142.228l-30.548 90.096 94.03-29.89c38.632 25.34 84.91 40.148 134.584 40.148 134.93 0 244.698-108.838 244.698-242.622-0.002-133.754-109.768-242.594-244.698-242.594z m146.972 309.076c-1.816-2.968-6.564-4.744-13.666-8.254-7.138-3.546-42.224-20.672-48.744-23.024-6.564-2.354-11.31-3.548-16.098 3.546-4.746 7.096-18.406 22.986-22.576 27.73-4.168 4.706-8.298 5.286-15.44 1.774-7.138-3.546-30.142-11.03-57.392-35.134-21.188-18.734-35.508-41.874-39.676-48.932-4.168-7.096-0.424-10.916 3.128-14.462 3.202-3.162 7.14-8.254 10.69-12.38 3.59-4.126 4.786-7.058 7.14-11.802 2.392-4.706 1.196-8.834-0.582-12.38-1.774-3.548-16.054-38.338-22-52.492-5.944-14.156-11.886-11.802-16.056-11.802-4.168 0-8.916-0.618-13.662-0.618-4.786 0-12.504 1.774-19.028 8.872-6.562 7.058-24.96 24.184-24.96 58.97 0 34.828 25.54 68.458 29.128 73.164 3.55 4.706 49.326 78.438 121.846 106.786 72.558 28.31 72.558 18.862 85.604 17.666 13.084-1.158 42.224-17.086 48.17-33.594 5.948-16.548 5.948-30.7 4.174-33.634z",
        fill: "#FFFFFF",
        "p-id": "2794"
    }), r("path", {
        d: "M516.846 216.778c160.75 0 291.048 129.204 291.048 288.608 0 159.354-130.298 288.558-291.048 288.558-51.026 0-98.962-13.04-140.684-35.908l-161.11 51.14 52.53-154.812c-26.514-43.504-41.762-94.494-41.762-149.018 0.002-159.364 130.302-288.568 291.026-288.568M288.232 737.708l94.03-29.89c38.632 25.34 84.91 40.148 134.584 40.148 134.93 0 244.698-108.838 244.698-242.622 0-133.756-109.768-242.594-244.698-242.594-134.934 0-244.67 108.838-244.67 242.634 0 53.058 17.33 102.234 46.604 142.228l-30.548 90.096m130.656-364.112c4.748 0 9.494 0.618 13.662 0.618 1.04 0 2.19-0.146 3.424-0.146 3.71 0 8.17 1.326 12.632 11.95 5.946 14.154 20.226 48.944 22 52.492 1.778 3.548 2.974 7.676 0.582 12.38-2.354 4.744-3.55 7.674-7.14 11.802-3.55 4.126-7.488 9.218-10.69 12.38-3.552 3.548-7.296 7.368-3.128 14.462 4.168 7.058 18.488 30.198 39.676 48.932 27.25 24.106 50.252 31.588 57.392 35.134 3.058 1.504 5.564 2.258 7.76 2.258 2.926 0 5.296-1.342 7.68-4.032 4.17-4.744 17.83-20.634 22.576-27.73 2.708-4.012 5.4-5.374 8.418-5.374 2.318 0 4.828 0.802 7.68 1.826 6.52 2.352 41.606 19.476 48.744 23.024 7.102 3.51 11.85 5.286 13.666 8.254 1.774 2.934 1.774 17.086-4.17 33.632-5.946 16.508-35.086 32.436-48.17 33.594-5.486 0.502-8.664 2.464-15.902 2.464-9.974 0-27.656-3.726-69.702-20.13-72.52-28.348-118.296-102.08-121.846-106.786-3.588-4.706-29.128-38.336-29.128-73.164 0-34.788 18.4-51.912 24.96-58.97 6.518-7.096 14.238-8.87 19.024-8.87m97.958-176.572c-82.978 0-161 32.05-219.694 90.25-58.738 58.242-91.084 135.69-91.084 218.074 0 53.16 13.768 105.242 39.902 151.236l-49.624 146.246a19.756 19.756 0 0 0 24.682 25.176l153.208-48.632c43.876 22.48 92.992 34.326 142.608 34.326 82.988 0 161.018-32.05 219.714-90.248 58.738-58.24 91.088-135.684 91.088-218.064 0-82.402-32.35-159.862-91.088-218.106-58.69-58.206-136.722-90.258-219.712-90.258z m-197.358 510.02l18-53.088a19.76 19.76 0 0 0-2.768-18.012c-27.994-38.244-42.79-83.392-42.79-130.56 0-122.896 100.898-222.88 224.916-222.88 124.034 0 224.944 99.966 224.944 222.84 0 122.888-100.91 222.868-224.944 222.868-44.142 0-86.934-12.764-123.75-36.912a19.76 19.76 0 0 0-16.818-2.308l-56.79 18.052z m99.4-353.202c-12.404 0-24.622 5.542-33.53 15.212-0.348 0.374-0.732 0.778-1.148 1.216-7.948 8.374-29.064 30.616-29.064 71.166 0 37.426 22.998 71.764 33.044 84.97 0.232 0.33 0.57 0.83 1.014 1.484 36.574 53.812 82.556 93.55 129.48 111.892 48.528 18.934 66.102 21.486 76.892 21.486 6.64 0 11.214-1.102 14.554-1.908 1.544-0.372 2.384-0.568 3.15-0.638 9.884-0.876 23.22-6.14 35.614-14.078 10.458-6.7 24.038-17.774 29.34-32.494 1.266-3.524 12.042-34.746 2.488-50.546l-0.054-0.088c-4.524-7.396-11.478-10.718-18.204-13.934-1.106-0.528-2.292-1.094-3.56-1.72-0.372-0.186-41.99-20.72-50.792-23.896-4.064-1.458-8.828-2.998-14.382-2.998-6.978 0-16.944 2.442-24.792 14.078-2.796 4.182-10.626 13.65-16.928 21l-1.628-0.704c-9.426-4.058-26.966-11.61-47.386-29.674-14.738-13.032-25.942-28.666-32.17-38.37 1.66-1.88 3.306-3.866 4.918-5.814 1.1-1.328 2.196-2.654 3.256-3.888 4.792-5.52 6.964-9.964 9.064-14.264 0.25-0.508 0.508-1.04 0.784-1.594 3.32-6.584 5.886-17.098-0.53-29.984-1.286-2.726-8.654-20.49-13.538-32.264-3.066-7.39-5.974-14.402-7.958-19.126-6.7-15.958-17.078-24.052-30.842-24.052-1.278 0-2.344 0.068-3.124 0.118l-0.44 0.028c-1.338-0.008-3.084-0.126-4.928-0.25-2.574-0.17-5.488-0.366-8.6-0.366z",
        fill: "#A7A9AC",
        "p-id": "2795"
    }), r("path", {
        d: "M728.078 956.122H294.83c-124.896 0-226.506-101.636-226.506-226.566V296.358c0-124.908 101.61-226.526 226.506-226.526h433.248c124.918 0 226.544 101.62 226.544 226.526v433.198c0.002 124.928-101.626 226.566-226.544 226.566zM294.83 89.636c-113.976 0-206.702 92.734-206.702 206.72v433.198c0 114.008 92.726 206.762 206.702 206.762h433.248c113.996 0 206.74-92.754 206.74-206.762V296.358c0-113.986-92.744-206.72-206.74-206.72H294.83z",
        fill: "#A7A9AC",
        "p-id": "2796"
    })])], -1);
a(), f.render = function (e, a, t, d, p, u) {
    const f = l("van-col"), L = l("van-row");
    return i(), n(o, null, [c(f, {class: "top"}, {
        default: s((() => [c(L, {
            class: "top-row",
            justify: "space-between",
            align: "center"
        }, {
            default: s((() => [c(f, null, {default: s((() => [v])), _: 1}), c(f, null, {
                default: s((() => [m])),
                _: 1
            })])), _: 1
        }), c(L, {
            class: "top-row",
            justify: "space-between",
            align: "center"
        }, {
            default: s((() => [c(f, null, {default: s((() => [h])), _: 1}), c(f, null, {
                default: s((() => [g])),
                _: 1
            })])), _: 1
        }), c(L, {
            class: "top-row",
            justify: "space-between",
            align: "center"
        }, {
            default: s((() => [c(f, null, {default: s((() => [w])), _: 1}), c(f, null, {
                default: s((() => [_])),
                _: 1
            })])), _: 1
        })])), _: 1
    }), c(L, {
        class: "info",
        align: "center"
    }, {
        default: s((() => [c(f, {span: "20"}, {
            default: s((() => [c(L, {justify: "center"}, {
                default: s((() => [c(f, null, {
                    default: s((() => [y])),
                    _: 1
                })])), _: 1
            }), c(L, {justify: "center"}, {
                default: s((() => [c(f, null, {
                    default: s((() => [r("span", {
                        class: "money",
                        onClick: a[0] || (a[0] = (...e) => d.copy && d.copy(...e))
                    }, z)])), _: 1
                })])), _: 1
            })])), _: 1
        }), c(f, {span: "4"}, {
            default: s((() => [c(L, {class: "copy", onClick: d.copy}, {
                default: s((() => [x, C])),
                _: 1
            }, 8, ["onClick"])])), _: 1
        })])), _: 1
    }), c(f, {class: "help-info"}, {
        default: s((() => [c(L, {align: "center"}, {
            default: s((() => [c(f, {
                span: "5",
                align: "center"
            }, {default: s((() => [b])), _: 1}), c(f, {span: "19"}, {default: s((() => [M])), _: 1})])), _: 1
        }), c(L, {align: "center"}, {
            default: s((() => [c(f, {span: "5", align: "center"}, {
                default: s((() => [B])),
                _: 1
            }), c(f, {span: "19"}, {default: s((() => [A])), _: 1})])), _: 1
        }), c(L, {align: "center"}, {
            default: s((() => [c(f, {span: "5", align: "center"}, {
                default: s((() => [E])),
                _: 1
            }), c(f, {span: "19"}, {default: s((() => [F])), _: 1})])), _: 1
        }), c(L, {align: "center"}, {
            default: s((() => [c(f, {offset: 10, align: "center"}, {
                default: s((() => [H])),
                _: 1
            })])), _: 1
        })])), _: 1
    })], 64)
}, f.__scopeId = "data-v-20655ba5";
p(f).use(u).mount("#app");
