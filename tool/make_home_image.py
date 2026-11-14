"""Draws the Home page illustration. Stdlib only."""
import struct
import zlib
from pathlib import Path

W, H = 960, 540


def put(buf, x, y, rgb):
    if 0 <= x < W and 0 <= y < H:
        i = (y * W + x) * 3
        buf[i : i + 3] = bytes(rgb)


def fill_rect(buf, x0, y0, x1, y1, rgb):
    for y in range(y0, y1):
        for x in range(x0, x1):
            put(buf, x, y, rgb)


def fill_circle(buf, cx, cy, r, rgb):
    r2 = r * r
    for y in range(cy - r, cy + r + 1):
        for x in range(cx - r, cx + r + 1):
            if (x - cx) ** 2 + (y - cy) ** 2 <= r2:
                put(buf, x, y, rgb)


def chunk(tag, data):
    crc = zlib.crc32(tag + data) & 0xFFFFFFFF
    return struct.pack(">I", len(data)) + tag + data + struct.pack(">I", crc)


def main():
    buf = bytearray(W * H * 3)
    for y in range(H):
        t = y / (H - 1)
        sky = (
            int(126 + (232 - 126) * t),
            int(196 + (244 - 196) * t),
            int(214 + (248 - 214) * t),
        )
        for x in range(W):
            put(buf, x, y, sky)

    fill_circle(buf, 760, 110, 48, (255, 214, 102))
    fill_rect(buf, 0, 380, W, H, (126, 184, 122))
    fill_rect(buf, 0, 370, W, 386, (104, 166, 98))

    # Roof
    for y in range(150, 250):
        half = int((y - 150) * 1.55)
        fill_rect(buf, 480 - half, y, 480 + half, y + 1, (196, 92, 62))

    fill_rect(buf, 300, 240, 660, 400, (245, 240, 230))
    fill_rect(buf, 292, 240, 668, 252, (232, 224, 210))
    fill_rect(buf, 448, 300, 522, 400, (92, 64, 50))
    fill_circle(buf, 508, 352, 5, (232, 196, 120))
    fill_rect(buf, 330, 270, 410, 340, (176, 214, 224))
    fill_rect(buf, 550, 270, 630, 340, (176, 214, 224))
    fill_rect(buf, 368, 270, 374, 340, (245, 240, 230))
    fill_rect(buf, 330, 302, 410, 308, (245, 240, 230))
    fill_rect(buf, 588, 270, 594, 340, (245, 240, 230))
    fill_rect(buf, 550, 302, 630, 308, (245, 240, 230))

    raw = b"".join(b"\x00" + bytes(buf[y * W * 3 : (y + 1) * W * 3]) for y in range(H))
    png = b"\x89PNG\r\n\x1a\n"
    png += chunk(b"IHDR", struct.pack(">IIBBBBB", W, H, 8, 2, 0, 0, 0))
    png += chunk(b"IDAT", zlib.compress(raw, 9))
    png += chunk(b"IEND", b"")

    out = Path(__file__).resolve().parents[1] / "assets" / "images" / "home.png"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(png)
    print(out, len(png))


if __name__ == "__main__":
    main()
