# def calculate_z_serial_purepython(q, maxiter, z):
#     output = [0] * len(q)
#     for i in range(len(q)):
#         zi = z[i]
#         qi = q[i]
#         for iteration in range(maxiter):
#             zi = zi * zi + qi
#             if abs(zi) > 2.0:
#                 output[i] = iteration
#                 break
#     return output


# def calculate_z_serial_purepython(list q, int maxiter, list z):
#     cdef unsigned int i
#     cdef int iteration
#     cdef complex zi, qi
#     cdef list output
#
#     output = [0] * len(q)
#     for i in range(len(q)):
#         zi = z[i]
#         qi = q[i]
#         for iteration in range(maxiter):
#             zi = zi * zi + qi
#             if abs(zi) > 2.0:
#                 output[i] = iteration
#                 break
#     return output


def calculate_z_serial_purepython(list q, int maxiter, list z):
    cdef unsigned int i
    cdef int iteration
    cdef complex zi, qi
    cdef list output
    cdef double zx, zy, qx, qy, zx_new, zy_new

    output = [0] * len(q)
    for i in range(len(q)):
        zx = z[i].real
        zy = z[i].imag
        qx = q[i].real
        qy = q[i].imag

        for iteration in range(maxiter):
            zx_new = (zx * zx - zy * zy) + qx
            zy_new = (zx * zy + zy * zx) + qy
            zx = zx_new
            zy = zy_new
            if (zx * zx + zy * zy) > 4.0:
                output[i] = iteration
                break
    return output